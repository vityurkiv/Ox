CDF      
      
len_string     !   len_line   Q   four      	time_step          len_name   !   num_dim       	num_nodes      $   num_elem      
num_el_blk        num_node_sets         num_side_sets         num_el_in_blk1        num_nod_per_el1       num_side_ss1      num_side_ss2      num_side_ss3      num_side_ss4      num_nod_ns1       num_nod_ns2       num_nod_ns3       num_nod_ns4       num_nod_var       num_elem_var      num_info  �         api_version       @�
=   version       @�
=   floating_point_word_size            	file_size               int64_status             title         composite_out.e    maximum_name_length                 %   
time_whole                            �t   	eb_status                             
(   eb_prop1               name      ID              
,   	ns_status         	                    
0   ns_prop1      	         name      ID              
@   	ss_status         
                    
P   ss_prop1      
         name      ID              
`   coordx                            
p   coordy                            �   eb_names                       $      �   ns_names      	                 �      �   ss_names      
                 �      X   
coor_names                         D      �   node_num_map                    �          connect1                  	elem_type         QUAD4        �      �   elem_num_map                    d      @   elem_ss1                          �   side_ss1                          �   elem_ss2                          �   side_ss2                          �   elem_ss3                          �   side_ss3                             elem_ss4                             side_ss4                          0   node_ns1                          D   node_ns2                          \   node_ns3                          t   node_ns4                          �   vals_nod_var1                                �|   name_nod_var                       $      �   name_elem_var                          �      �   vals_elem_var1eb1                          �      ��   vals_elem_var2eb1                          �      �d   vals_elem_var3eb1                          �      �,   vals_elem_var4eb1                          �      ��   elem_var_tab                             L   info_records                      �      \                                                                 ?ə�����?ə�����        ?ٙ�����?ٙ�����?�333333?�333333?陙����?陙����?�      ?�      ?ə�����        ?ٙ�����?�333333?陙����?�      ?ə�����        ?ٙ�����?�333333?陙����?�      ?ə�����        ?ٙ�����?�333333?陙����?�      ?ə�����        ?ٙ�����?�333333?陙����?�                      ?ə�����?ə�����        ?ə�����        ?ə�����        ?ə�����        ?ə�����?ٙ�����?ٙ�����?ٙ�����?ٙ�����?ٙ�����?ٙ�����?�333333?�333333?�333333?�333333?�333333?�333333?陙����?陙����?陙����?陙����?陙����?陙����?�      ?�      ?�      ?�      ?�      ?�                                          top                              right                            bottom                           left                             bottom                           left                             right                            top                                                                                                                             	   
                                                                      !   "   #   $                                          	   
      	         
                                          
         
                                                                                                                                                       !            "   !         #   "         $   #                           	   
                                                                                                            
                                                            #   $          !   "   $                        	                            c                                   s11 ?陙����?�      ?�      ?ə��s22        ?ٙ�����?�333333?陙��ds11      ?ə�����        ?ٙ����ds22 3333?陙����?�      ?ə�����            ####################?�      ?�      ?ə�����        ?ٙ�����?�333333?陙����?�   # Created by MOOSE #ٙ�����?�333333?陙����?�      ?ə�����        ?ٙ�����?�3333####################������        ?ٙ�����?�333333?陙����?�      ��bM�����bM��### Command Line Arguments ###����bM���        ?�bM���?�bM�����bM�����bM���-i      ?�bM���?�bM�����bM�����bM���        ?�bM���?�bM�����bM�����bM��� composite.i���?�bM���?�bM���?�bM���        ��bM�����bM���?�bM���?�bM���        ��bM�����bM���?�bM���?�bM���        ��bM�����bM���?�bM���?�bM���   ### Version Info ###�?�bM���?�bM���        ��bM�����bM�����z�G�|��z�G�z��z�Framework Information:z�G�|��z�G�z��z�G�{��z�G�{��z�G�{��z�G�|��z�G�z��z�GMOOSE version:           git commit 59d6791 on 2016-04-19{��z�G�|��z�G�z��z�G�PETSc Version:           3.6.3G�z?�z�G�{?�z�G�{?�z�G�{?�z�G�|?�z�G�z?�z�G�Current Time:            Wed Apr 20 10:12:23 2016?�z�G�{?�z�G�|?�z�G�z?�z�G�{Executable Timestamp:    Wed Apr 20 10:11:58 2016�z�G�{                                                                                                                                                                                           ### Input File ###                                                                                                                                                []                                                                                 initial_from_file_timestep     = LATEST                                          initial_from_file_var          = INVALID                                         element_order                  = AUTO                                            order                          = AUTO                                            side_order                     = AUTO                                            type                           = GAUSS                                         []                                                                                                                                                                [AuxKernels]                                                                                                                                                        [./ds11]                                                                           type                         = RankTwoAux                                        block                        = INVALID                                           boundary                     = INVALID                                           control_tags                 = AuxKernels                                        enable                       = 1                                                 execute_on                   = INITIAL                                           index_i                      = 0                                                 index_j                      = 0                                                 rank_two_tensor              = delastic_strain/dc                                seed                         = 0                                                 use_displaced_mesh           = 0                                                 variable                     = ds11                                            [../]                                                                                                                                                             [./ds22]                                                                           type                         = RankTwoAux                                        block                        = INVALID                                           boundary                     = INVALID                                           control_tags                 = AuxKernels                                        enable                       = 1                                                 execute_on                   = INITIAL                                           index_i                      = 1                                                 index_j                      = 1                                                 rank_two_tensor              = delastic_strain/dc                                seed                         = 0                                                 use_displaced_mesh           = 0                                                 variable                     = ds22                                            [../]                                                                                                                                                             [./s11]                                                                            type                         = RankTwoAux                                        block                        = INVALID                                           boundary                     = INVALID                                           control_tags                 = AuxKernels                                        enable                       = 1                                                 execute_on                   = INITIAL                                           index_i                      = 0                                                 index_j                      = 0                                                 rank_two_tensor              = stress_free_strain                                seed                         = 0                                                 use_displaced_mesh           = 0                                                 variable                     = s11                                             [../]                                                                                                                                                             [./s22]                                                                            type                         = RankTwoAux                                        block                        = INVALID                                           boundary                     = INVALID                                           control_tags                 = AuxKernels                                        enable                       = 1                                                 execute_on                   = INITIAL                                           index_i                      = 1                                                 index_j                      = 1                                                 rank_two_tensor              = stress_free_strain                                seed                         = 0                                                 use_displaced_mesh           = 0                                                 variable                     = s22                                             [../]                                                                          []                                                                                                                                                                [AuxVariables]                                                                                                                                                      [./c]                                                                              block                        = INVALID                                           family                       = LAGRANGE                                          initial_condition            = INVALID                                           order                        = FIRST                                             outputs                      = INVALID                                           initial_from_file_timestep   = LATEST                                            initial_from_file_var        = INVALID                                                                                                                            [./InitialCondition]                                                               type                       = FunctionIC                                          block                      = INVALID                                             boundary                   = INVALID                                             control_tags               = AuxVariables/c                                      enable                     = 1                                                   function                   = x                                                   variable                   = c                                                 [../]                                                                          [../]                                                                                                                                                             [./ds11]                                                                           block                        = INVALID                                           family                       = MONOMIAL                                          initial_condition            = INVALID                                           order                        = CONSTANT                                          outputs                      = INVALID                                           initial_from_file_timestep   = LATEST                                            initial_from_file_var        = INVALID                                         [../]                                                                                                                                                             [./ds22]                                                                           block                        = INVALID                                           family                       = MONOMIAL                                          initial_condition            = INVALID                                           order                        = CONSTANT                                          outputs                      = INVALID                                           initial_from_file_timestep   = LATEST                                            initial_from_file_var        = INVALID                                         [../]                                                                                                                                                             [./s11]                                                                            block                        = INVALID                                           family                       = MONOMIAL                                          initial_condition            = INVALID                                           order                        = CONSTANT                                          outputs                      = INVALID                                           initial_from_file_timestep   = LATEST                                            initial_from_file_var        = INVALID                                         [../]                                                                                                                                                             [./s22]                                                                            block                        = INVALID                                           family                       = MONOMIAL                                          initial_condition            = INVALID                                           order                        = CONSTANT                                          outputs                      = INVALID                                           initial_from_file_timestep   = LATEST                                            initial_from_file_var        = INVALID                                         [../]                                                                          []                                                                                                                                                                [Executioner]                                                                      type                           = Transient                                       abort_on_solve_fail            = 0                                               compute_initial_residual_before_preset_bcs = 0                                   control_tags                   =                                                 dt                             = 1                                               dtmax                          = 1e+30                                           dtmin                          = 2e-14                                           enable                         = 1                                               end_time                       = 1e+30                                           l_abs_step_tol                 = -1                                              l_max_its                      = 10000                                           l_tol                          = 1e-05                                           line_search                    = default                                         max_xfem_update                = 4294967295                                      n_startup_steps                = 0                                               nl_abs_step_tol                = 1e-50                                           nl_abs_tol                     = 1e-50                                           nl_max_funcs                   = 10000                                           nl_max_its                     = 50                                              nl_rel_step_tol                = 1e-50                                           nl_rel_tol                     = 1e-08                                           no_fe_reinit                   = 0                                               num_steps                      = 1                                               petsc_options                  = INVALID                                         petsc_options_iname            = INVALID                                         petsc_options_value            = INVALID                                         picard_abs_tol                 = 1e-50                                           picard_max_its                 = 1                                               picard_rel_tol                 = 1e-08                                           reset_dt                       = 0                                               restart_file_base              =                                                 scheme                         = INVALID                                         solve_type                     = INVALID                                         splitting                      = INVALID                                         ss_check_tol                   = 1e-08                                           ss_tmin                        = 0                                               start_time                     = 0                                               time_period_ends               = INVALID                                         time_period_starts             = INVALID                                         time_periods                   = INVALID                                         timestep_tolerance             = 2e-14                                           trans_ss_check                 = 0                                               use_multiapp_dt                = 0                                               verbose                        = 0                                             []                                                                                                                                                                [Executioner]                                                                      _fe_problem                    = 0x7f7f6c005400                                []                                                                                                                                                                [Materials]                                                                                                                                                         [./eigen1]                                                                         type                         = GenericConstantRankTwoTensor                      block                        = INVALID                                           boundary                     = INVALID                                           compute                      = 1                                                 control_tags                 = Materials                                         enable                       = 1                                                 implicit                     = 1                                                 output_properties            = INVALID                                           outputs                      = none                                              seed                         = 0                                                 tensor_name                  = eigen1                                            tensor_values                = '1 -1 0 0 0 0'                                    use_displaced_mesh           = 0                                               [../]                                                                                                                                                             [./eigen2]                                                                         type                         = GenericConstantRankTwoTensor                      block                        = INVALID                                           boundary                     = INVALID                                           compute                      = 1                                                 control_tags                 = Materials                                         enable                       = 1                                                 implicit                     = 1                                                 output_properties            = INVALID                                           outputs                      = none                                              seed                         = 0                                                 tensor_name                  = eigen2                                            tensor_values                = '-1 1 0 0 0 0'                                    use_displaced_mesh           = 0                                               [../]                                                                                                                                                             [./eigenstrain]                                                                    type                         = CompositeEigenstrain                              args                         = c                                                 base_name                    = INVALID                                           block                        = 0                                                 boundary                     = INVALID                                           compute                      = 1                                                 control_tags                 = Materials                                         enable                       = 1                                                 implicit                     = 1                                                 incremental_form             = 0                                                 output_properties            = INVALID                                           outputs                      = none                                              seed                         = 0                                                 tensors                      = 'eigen1 eigen2'                                   use_displaced_mesh           = 0                                                 weights                      = 'weight1 weight2'                               [../]                                                                                                                                                             [./weight1]                                                                        type                         = DerivativeParsedMaterial                          args                         = c                                                 block                        = INVALID                                           boundary                     = INVALID                                           compute                      = 1                                                 constant_expressions         =                                                   constant_names               =                                                   control_tags                 = Materials                                         derivative_order             = 3                                                 disable_fpoptimizer          = 0                                                 enable                       = 1                                                 enable_jit                   = 1                                                 f_name                       = weight1                                           fail_on_evalerror            = 0                                                 function                     = 0.02*c^2                                          implicit                     = 1                                                 material_property_names      =                                                   output_properties            = INVALID                                           outputs                      = none                                              seed                         = 0                                                 third_derivatives            = INVALID                                           tol_names                    =                                                   tol_values                   =                                                   use_displaced_mesh           = 0                                               [../]                                                                                                                                                             [./weight2]                                                                        type                         = DerivativeParsedMaterial                          args                         = c                                                 block                        = INVALID                                           boundary                     = INVALID                                           compute                      = 1                                                 constant_expressions         =                                                   constant_names               =                                                   control_tags                 = Materials                                         derivative_order             = 3                                                 disable_fpoptimizer          = 0                                                 enable                       = 1                                                 enable_jit                   = 1                                                 f_name                       = weight2                                           fail_on_evalerror            = 0                                                 function                     = 0.02*(1-c)^2                                      implicit                     = 1                                                 material_property_names      =                                                   output_properties            = INVALID                                           outputs                      = none                                              seed                         = 0                                                 third_derivatives            = INVALID                                           tol_names                    =                                                   tol_values                   =                                                   use_displaced_mesh           = 0                                               [../]                                                                          []                                                                                                                                                                [Mesh]                                                                             displacements                  = INVALID                                         block_id                       = INVALID                                         block_name                     = INVALID                                         boundary_id                    = INVALID                                         boundary_name                  = INVALID                                         construct_side_list_from_node_list = 0                                           ghosted_boundaries             = INVALID                                         ghosted_boundaries_inflation   = INVALID                                         patch_size                     = 40                                              second_order                   = 0                                               skip_partitioning              = 0                                               type                           = GeneratedMesh                                   uniform_refine                 = 0                                               bias_x                         = 1                                               bias_y                         = 1                                               bias_z                         = 1                                               centroid_partitioner_direction = INVALID                                         control_tags                   =                                                 dim                            = 2                                               distribution                   = DEFAULT                                         elem_type                      = INVALID                                         enable                         = 1                                               nemesis                        = 0                                               nx                             = 5                                               ny                             = 5                                               nz                             = 1                                               partitioner                    = default                                         patch_update_strategy          = never                                           xmax                           = 1                                               xmin                           = 0                                               ymax                           = 1                                               ymin                           = 0                                               zmax                           = 1                                               zmin                           = 0                                             []                                                                                                                                                                [Mesh]                                                                           []                                                                                                                                                                [Outputs]                                                                          append_date                    = 0                                               append_date_format             = INVALID                                         checkpoint                     = 0                                               color                          = 1                                               console                        = 1                                               controls                       = 0                                               csv                            = 0                                               dofmap                         = 0                                               execute_on                     = FINAL                                           exodus                         = 1                                               file_base                      = INVALID                                         gmv                            = 0                                               gnuplot                        = 0                                               hide                           = INVALID                                         interval                       = 1                                               nemesis                        = 0                                               output_if_base_contains        = INVALID                                         print_linear_residuals         = 1                                               print_mesh_changed_info        = 0                                               print_perf_log                 = 0                                               show                           = INVALID                                         solution_history               = 0                                               sync_times                     =                                                 tecplot                        = 0                                               vtk                            = 0                                               xda                            = 0                                               xdr                            = 0                                             []                                                                                                                                                                [Problem]                                                                          block                          = INVALID                                         coord_type                     = XYZ                                             fe_cache                       = 0                                               kernel_coverage_check          = 0                                               material_coverage_check        = 1                                               name                           = 'MOOSE Problem'                                 restart_file_base              = INVALID                                         rz_coord_axis                  = Y                                               type                           = FEProblem                                       use_legacy_uo_aux_computation  = INVALID                                         use_legacy_uo_initialization   = INVALID                                         library_path                   =                                                 object_names                   = INVALID                                         register_objects_from          = INVALID                                         control_tags                   =                                                 dimNearNullSpace               = 0                                               dimNullSpace                   = 0                                               enable                         = 1                                               error_on_jacobian_nonzero_reallocation = 0                                       force_restart                  = 0                                               petsc_inames                   =                                                 petsc_options                  = INVALID                                         petsc_values                   =                                                 solve                          = 0                                               use_nonlinear                  = 1                                             []                                                                               ?�              ?ə�����?ə�����        ?ٙ�����?ٙ�����?�333333?�333333?陙����?陙����?�      ?�      ?ə�����        ?ٙ�����?�333333?陙����?�      ?ə�����        ?ٙ�����?�333333?陙����?�      ?ə�����        ?ٙ�����?�333333?陙����?�      ?ə�����        ?ٙ�����?�333333?陙����?�      ��bM�����bM���        ?�bM���?�bM�����bM�����bM���        ?�bM���?�bM�����bM�����bM���        ?�bM���?�bM�����bM�����bM���        ?�bM���?�bM�����bM�����bM���        ?�bM���?�bM���?�bM���?�bM���        ��bM�����bM���?�bM���?�bM���        ��bM�����bM���?�bM���?�bM���        ��bM�����bM���?�bM���?�bM���        ��bM�����bM���?�bM���?�bM���        ��bM�����bM�����z�G�|��z�G�z��z�G�{��z�G�{��z�G�{��z�G�|��z�G�z��z�G�{��z�G�{��z�G�{��z�G�|��z�G�z��z�G�{��z�G�{��z�G�{��z�G�|��z�G�z��z�G�{��z�G�{��z�G�{��z�G�|��z�G�z��z�G�{��z�G�{��z�G�{?�z�G�|?�z�G�z?�z�G�{?�z�G�{?�z�G�{?�z�G�|?�z�G�z?�z�G�{?�z�G�{?�z�G�{?�z�G�|?�z�G�z?�z�G�{?�z�G�{?�z�G�{?�z�G�|?�z�G�z?�z�G�{?�z�G�{?�z�G�{?�z�G�|?�z�G�z?�z�G�{?�z�G�{?�z�G�{