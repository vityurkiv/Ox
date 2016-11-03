[Mesh]
  type = FileMesh
  file = void2d_mesh.xda
[]

[Variables]
  [./u]
  [../]
  [./v]
  [../]
  [./c]
  [../]
  [./b]
  [../]
[]

[AuxVariables]
  [./resid_x]
  [../]
  [./resid_y]
  [../]
  [./stress_yy]
    order = CONSTANT
    family = MONOMIAL
  [../]
[]

[Functions]
  [./tfunc]
    type = ParsedFunction
    value = t
  [../]
[]

[Kernels]
  [./pfbulk]
    type = PFFracBulkRate
    variable = c
    l = 0.01
    beta = b
    visco =1e-1
    gc_prop_var = 'gc_prop'
    G0_var = 'G0_pos'
    dG0_dstrain_var = 'dG0_pos_dstrain'
    disp_x = u
    disp_y = v
  [../]
  [./solid_x]
    type = StressDivergencePFFracTensors
    variable = u
    displacements = 'u v'
    component = 0
    save_in = resid_x
    c = c
  [../]
  [./solid_y]
    type = StressDivergencePFFracTensors
    variable = v
    displacements = 'u v'
    component = 1
    save_in = resid_y
    c = c
  [../]
  [./dcdt]
    type = TimeDerivative
    variable = c
  [../]
  [./pfintvar]
    type = PFFracIntVar
    variable = b
  [../]
  [./pfintcoupled]
    type = PFFracCoupledInterface
    variable = b
    c = c
  [../]
[]

[AuxKernels]
  [./stress_yy]
    type = RankTwoAux
    variable = stress_yy
    rank_two_tensor = stress
    index_j = 1
    index_i = 1
    execute_on = timestep_end
  [../]
[]

[BCs]
  [./ydisp]
    type = FunctionPresetBC
    variable = v
    boundary = top
    function = tfunc
  [../]
  [./yfix]
    type = PresetBC
    variable = v
    boundary = bottom
    value = 0
  [../]
  [./xfix]
    type = PresetBC
    variable = u
    boundary = left
    value = 0
  [../]
[]

[Functions]
  [./void_prop_func]
    type = ParsedFunction
    value = 'rad:=0.2;m:=50;r:=sqrt(x^2+y^2);1-exp(-(r/rad)^m)+1e-8'
  [../]
  [./gb_prop_func]
    type = ParsedFunction
    value = 'rad:=0.2;thk:=0.05;m:=50;sgnx:=1-exp(-(x/rad)^m);v:=sgnx*exp(-(y/thk)^m);0.005*(1-v)+0.001*v'
  [../]
[../]

[Materials]
  [./pfbulkmat]
    type = PFFracBulkRateMaterial
    block = 0
    function = gb_prop_func
  [../]
  [./elastic]
    type = LinearIsoElasticPFDamage
    block = 0
    c = c
    kdamage = 1e-8
  [../]
  [./elasticity_tensor]
    type = ComputeElasticityTensor
    block = 0
    C_ijkl = '120.0 80.0'
    fill_method = symmetric_isotropic
    elasticity_tensor_prefactor = void_prop_func
  [../]
  [./strain]
    type = ComputeSmallStrain
    block = 0
    displacements = 'u v'
  [../]
[]

[Postprocessors]
  [./resid_x]
    type = NodalSum
    variable = resid_x
    boundary = left
  [../]
  [./resid_y]
    type = NodalSum
    variable = resid_y
    boundary = top
  [../]
[]

[Preconditioning]
  active = 'smp'
  [./smp]
    type = SMP
    full = true
  [../]
[]

[Executioner]
  type = Transient

  solve_type = PJFNK
  petsc_options_iname = '-pc_type -ksp_gmres_restart -sub_ksp_type -sub_pc_type -pc_asm_overlap'
  petsc_options_value = 'asm      31                  preonly       lu           1'

  nl_rel_tol = 1e-8
  l_max_its = 10
  nl_max_its = 10

  dt = 1e-4
  dtmin = 1e-4
  num_steps = 2
[]

[Outputs]
  exodus = true
  csv = true
  gnuplot = true
[]
