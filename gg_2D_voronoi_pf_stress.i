# This simulation predicts GB migration of a 2D copper polycrystal with 15 grains
# Mesh adaptivity and time step adaptivity are used
# An AuxVariable is used to calculate the grain boundary locations
# Postprocessors are used to record time step and the number of grains

[Mesh]
  # Mesh block.  Meshes can be read in or automatically generated
  type = GeneratedMesh
  dim = 2 # Problem dimension
  nx = 17 # Number of elements in the x-direction
  ny = 17 # Number of elements in the y-direction
  nz = 0 # Number of elements in the z-direction
  xmin = 0    # minimum x-coordinate of the mesh
  xmax = 1000 # maximum x-coordinate of the mesh
  ymin = 0    # minimum y-coordinate of the mesh
  ymax = 1000 # maximum y-coordinate of the mesh
  zmin = 0
  zmax = 0
  elem_type = QUAD4 # Type of elements used in the mesh
  uniform_refine = 1 # Initial uniform refinement of the mesh
[]

[GlobalParams]
  # Parameters used by several kernels that are defined globally to simplify input file
  op_num = 10 # Number of grains
  var_name_base = gr # Base name of grains
[]

[Variables]
  # Variable block, where all variables in the simulation are declared
  [./PolycrystalVariables]
    # Custom action that created all of the grain variables
    order = FIRST # element type used by each grain variable
    family = LAGRANGE
  [../]
  [./c]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0
  [../]

  [./w]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0
  [../]
[]

[ICs]
  [./PolycrystalICs]
    [./PolycrystalVoronoiIC]
      grain_num = 10
    [../]
  [../]
[]

[AuxVariables]
#active = ''
  # Dependent variables
  [./bnds]
    # Variable used to visualize the grain boundaries in the simulation
    order = FIRST
    family = LAGRANGE
  [../]

[]

[Kernels]
  # Kernel block, where the kernels defining the residual equations are set up.
  [./PolycrystalKernel]
    # Custom action creating all necessary kernels for grain growth.  All input parameters are up in GlobalParams
  [../]

  # Cahn-Hilliard kernels
    [./c_res]
      type = SplitCHParsed
      variable = c
      f_name = F
      kappa_name = kappa_c
      w = w
   #   args = 'eta'
    [../]
    [./w_res]
      type = SplitCHWRes
      variable = w
      mob_name = M
    [../]
    [./time]
      type = CoupledTimeDerivative
      variable = w
      v = c
    [../]

[]

[AuxKernels]
#active = ''
  # AuxKernel block, defining the equations used to calculate the auxvars
  [./bnds_aux]
    # AuxKernel that calculates the GB term
    type = BndsCalcAux
    variable = bnds
    execute_on = timestep_end
  [../]
[]

[BCs]
  # Boundary Condition block
  [./Periodic]
    [./top_bottom]
      auto_direction = 'x y' # Makes problem periodic in the x and y directions
      variable = 'gr0 gr1 gr2 gr3 gr4 gr5 gr6 gr7 gr8 gr9'
    [../]
  [../]

  [./c_out] #Concentration on outer edge is fixed at 1
 type = PresetBC
 variable = c
 boundary = '0'
 value = 1
[../]

[./w] #Concentration on outer edge is fixed at 1
 type = PresetBC
 variable = w
 boundary = '0'
 value = 10
[../]

[]

[Materials]
  [./CuGrGr]
    # Material properties
    type = GBEvolution # Quantitative material properties for copper grain growth.  Dimensions are nm and ns
    block = 0 # Block ID (only one block in this problem)
    GBmob0 = 7.5e-6 #Mobility prefactor for Cu from Schonfelder1997
    GBenergy = 0.708 #GB energy for Cu from Schonfelder1997
    Q = 0.23 #Activation energy for grain growth from Schonfelder 1997
    T = 450 # K   #Constant temperature of the simulation (for mobility calculation)
    wGB = 15 # nm      #Width of the diffuse GB
  [../]

  [./kappa_c]
    type = GenericConstantMaterial
    prop_names  = 'kappa_c'
    prop_values = '0.00001'
    block = 0
  [../]

  [./mob_c]
    type = GenericConstantMaterial
    block = 0
    prop_names  = 'M'
    prop_values = '20'
  [../]

# [./mob_c]
#   type = DerivativeParsedMaterial
#   block = 0
#   f_name = 'M'
#   function = '20/(0.01+bnds)'
#   args = 'bnds'
 #[../]

  [./free_energy]
    type = DerivativeParsedMaterial
    block = 0
    f_name = F
    args = 'c bnds'
    constant_names = 'barr_height  cv_eq'
    constant_expressions = '0.1          0.2'
    function = 16*barr_height*(c)^2*(1-cv_eq-c)^2+c*plog(c,0.005)+(1-c)*plog(1-c,0.005)+(c+3*bnds)^2

    #function = 16*barr_height*(c-cv_eq)^2*(1-cv_eq-c)^2+(c-eta)^1
    derivative_order = 2
  [../]

[]

[Postprocessors]
#active = 'dt '
  # Scalar postprocessors
  [./ngrains]
  #Counts the number of grains in the polycrystal
    type = FeatureFloodCount
    variable = bnds
    threshold = 0.7
  [../]
  [./dt]
    # Outputs the current time step
    type = TimestepSize
  [../]
[]

[Executioner]
  type = Transient # Type of executioner, here it is transient with an adaptive time step
  scheme = bdf2 # Type of time integration (2nd order backward euler), defaults to 1st order backward euler

  #Preconditioned JFNK (default)
  solve_type = 'PJFNK'

  petsc_options_iname = '-pc_type -ksp_gmres_restart -sub_ksp_type -sub_pc_type -pc_asm_overlap'
  petsc_options_value = 'asm      101                  preonly       lu           25'

  l_max_its = 20 # Max number of linear iterations
  l_tol = 1e-1 # Relative tolerance for linear solves
  nl_max_its = 20 # Max number of nonlinear iterations
  nl_abs_tol = 1e-1 # Relative tolerance for nonlienar solves
  nl_rel_tol = 1e-1 # Absolute tolerance for nonlienar solves

  start_time = 0.0
  end_time = 700

  [./TimeStepper]
    type = IterationAdaptiveDT
    dt = 0.1 # Initial time step.  In this simulation it changes.
  #  optimal_iterations = 6 #Time step will adapt to maintain this number of nonlinear iterations
  [../]

#  [./Adaptivity]
   # Block that turns on mesh adaptivity. Note that mesh will never coarsen beyond initial mesh (before uniform refinement)
#    initial_adaptivity = 2 # Number of times mesh is adapted to initial condition
#   refine_fraction = 0.7 # Fraction of high error that will be refined
#    coarsen_fraction = 0.1 # Fraction of low error that will coarsened
#    max_h_level = 4 # Max number of refinements used, starting from initial mesh (before uniform refinement)
#  [../]
[]

[Outputs]
  exodus = true
  csv = true
  [./console]
    type = Console
    max_rows = 20
  [../]
#   xda = true #XDA writes out the perfect internal state of all variables, allowing SolutionUserObject to read back in higher order solutions and adapted meshes
[]
