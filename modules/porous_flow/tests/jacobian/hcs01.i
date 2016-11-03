# apply a half-cubic sink flux and observe the correct behavior
[Mesh]
  type = GeneratedMesh
  dim = 3
  nx = 1
  ny = 1
  nz = 2
  xmin = -1
  xmax = 1
  ymin = -1
  ymax = 1
[]

[GlobalParams]
  PorousFlowDictator = dictator
[]

[Variables]
  [./ppwater]
  [../]
  [./ppgas]
  [../]
  [./massfrac_ph0_sp0]
  [../]
  [./massfrac_ph1_sp0]
  [../]
[]


[UserObjects]
  [./dictator]
    type = PorousFlowDictator
    porous_flow_vars = 'ppwater ppgas massfrac_ph0_sp0 massfrac_ph1_sp0'
    number_fluid_phases = 2
    number_fluid_components = 2
  [../]
[]

[ICs]
  [./ppwater]
    type = RandomIC
    variable = ppwater
    min = -1
    max = 0
  [../]
  [./ppgas]
    type = RandomIC
    variable = ppgas
    min = 0
    max = 1
  [../]
  [./massfrac_ph0_sp0]
    type = RandomIC
    variable = massfrac_ph0_sp0
    min = 0
    max = 1
  [../]
  [./massfrac_ph1_sp0]
    type = RandomIC
    variable = massfrac_ph1_sp0
    min = 0
    max = 1
  [../]
[]

[Kernels]
  [./dummy_ppwater]
    type = TimeDerivative
    variable = ppwater
  [../]
  [./dummy_ppgas]
    type = TimeDerivative
    variable = ppgas
  [../]
  [./dummy_m00]
    type = TimeDerivative
    variable = massfrac_ph0_sp0
  [../]
  [./dummy_m10]
    type = TimeDerivative
    variable = massfrac_ph1_sp0
  [../]
[]

[Materials]
  [./temperature]
    type = PorousFlowTemperature
  [../]
  [./nnn]
    type = PorousFlowNodeNumber
    on_initial_only = true
  [../]
  [./ppss]
    type = PorousFlow2PhasePP_VG
    phase0_porepressure = ppwater
    phase1_porepressure = ppgas
    al = 1
    m = 0.5
  [../]
  [./massfrac]
    type = PorousFlowMassFraction
    mass_fraction_vars = 'massfrac_ph0_sp0 massfrac_ph1_sp0'
  [../]
  [./dens0]
    type = PorousFlowDensityConstBulk
    density_P0 = 1
    bulk_modulus = 1.5
    phase = 0
  [../]
  [./dens1]
    type = PorousFlowDensityConstBulk
    density_P0 = 0.5
    bulk_modulus = 0.5
    phase = 1
  [../]
  [./dens_all]
    type = PorousFlowJoiner
    include_old = true
    material_property = PorousFlow_fluid_phase_density
  [../]
  [./dens_qp_all]
    type = PorousFlowJoiner
    material_property = PorousFlow_fluid_phase_density_qp
    at_qps = true
  [../]
  [./visc0]
    type = PorousFlowViscosityConst
    viscosity = 1
    phase = 0
  [../]
  [./visc1]
    type = PorousFlowViscosityConst
    viscosity = 1.4
    phase = 1
  [../]
  [./visc_all]
    type = PorousFlowJoiner
    material_property = PorousFlow_viscosity
  [../]
  [./permeability]
    type = PorousFlowPermeabilityConst
    permeability = '1 0 0 0 2 0 0 0 3'
  [../]
  [./relperm0]
    type = PorousFlowRelativePermeabilityCorey
    n_j = 2
    phase = 0
  [../]
  [./relperm1]
    type = PorousFlowRelativePermeabilityCorey
    n_j = 3
    phase = 1
  [../]
  [./relperm_all]
    type = PorousFlowJoiner
    material_property = PorousFlow_relative_permeability
  [../]
[]

[BCs]
  [./flux_w]
    type = PorousFlowHalfCubicSink
    boundary = 'left'
    center = 0.1
    cutoff = -1.1
    max = 2.2
    variable = ppwater
    mass_fraction_component = 0
    fluid_phase = 0
    use_relperm = true
    use_mobility = true
    flux_function = 'x*y'
  [../]
  [./flux_g]
    type = PorousFlowHalfCubicSink
    boundary = 'top left front'
    center = 0.5
    cutoff = -1.1
    max = -2.2
    mass_fraction_component = 0
    variable = ppgas
    fluid_phase = 1
    use_relperm = true
    use_mobility = true
    flux_function = '-x*y'
  [../]
  [./flux_1]
    type = PorousFlowHalfCubicSink
    boundary = 'right'
    center = -0.1
    cutoff = -1.1
    max = 1.2
    mass_fraction_component = 1
    variable = massfrac_ph0_sp0
    fluid_phase = 1
    use_relperm = true
    use_mobility = true
    flux_function = '-1.1*x*y'
  [../]
  [./flux_2]
    type = PorousFlowHalfCubicSink
    boundary = 'bottom'
    center = 3.2
    cutoff = -1.1
    max = 1.2
    mass_fraction_component = 1
    variable = massfrac_ph1_sp0
    fluid_phase = 1
    use_relperm = true
    use_mobility = true
    flux_function = '0.5*x*y'
  [../]
[]


[Preconditioning]
  [./check]
    type = SMP
    full = true
    petsc_options_iname = '-ksp_type -pc_type -snes_atol -snes_rtol -snes_max_it -snes_type'
    petsc_options_value = 'bcgs bjacobi 1E-15 1E-10 10000 test'
  [../]
[]

[Executioner]
  type = Transient
  solve_type = Newton
  dt = 1
  end_time = 2
[]

[Outputs]
  file_base = hcs01
[]
