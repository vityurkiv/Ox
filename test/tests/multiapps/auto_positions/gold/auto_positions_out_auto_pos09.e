CDF      
      
len_string     !   len_line   Q   four      	time_step          len_name   !   num_dim       	num_nodes         num_elem   
   
num_el_blk        num_node_sets         num_side_sets         num_el_in_blk1     
   num_nod_per_el1       num_side_ss1      num_side_ss2      num_nod_ns1       num_nod_ns2       num_nod_var       num_glo_var       num_info  1         api_version       @�
=   version       @�
=   floating_point_word_size            	file_size               int64_status             title          auto_positions_out_auto_pos09.e    maximum_name_length                    
time_whole                            k�   	eb_status                                eb_prop1               name      ID                 	ns_status         	                        ns_prop1      	         name      ID              (   	ss_status         
                    0   ss_prop1      
         name      ID              8   coordx                      X      @   coordy                      X      �   coordz                      X      �   eb_names                       $      	H   ns_names      	                 D      	l   ss_names      
                 D      	�   
coor_names                         d      	�   node_num_map                    ,      
X   connect1                  	elem_type         EDGE2         P      
�   elem_num_map                    (      
�   elem_ss1                          
�   side_ss1                              elem_ss2                             side_ss2                             node_ns1                             node_ns2                             vals_nod_var1                          X      k�   name_nod_var                       $         name_glo_var                       $      8   vals_glo_var                             l@   info_records                      `�      \                                 ��      �������Ϳ陙������ffffff��333333��      �ٙ�������333334�ə�������������                                                                                                                                                                                                                            left                             right                              right                            left                                                                                                                                                              	   
                                                   	   	   
   
                              	   
   
               u                                   master_value                        ####################                                                             # Created by MOOSE #                                                             ####################                                                             ### Command Line Arguments ###                                                   ### Input File ###                                                                                                                                                []                                                                                 initial_from_file_timestep     = 2                                               initial_from_file_var          = INVALID                                         block                          = INVALID                                         coord_type                     = XYZ                                             fe_cache                       = 0                                               kernel_coverage_check          = 1                                               name                           = 'MOOSE Problem'                                 type                           = FEProblem                                       element_order                  = AUTO                                            order                          = AUTO                                            side_order                     = AUTO                                            active_bcs                     = INVALID                                         active_kernels                 = INVALID                                         inactive_bcs                   = INVALID                                         inactive_kernels               = INVALID                                         start                          = 0                                               dimNearNullSpace               = 0                                               dimNullSpace                   = 0                                               long_name                      =                                                 solve                          = 1                                               use_nonlinear                  = 1                                             []                                                                                                                                                                [BCs]                                                                                                                                                               [./left]                                                                           boundary                     = left                                              type                         = DirichletBC                                       use_displaced_mesh           = 0                                                 variable                     = u                                                 long_name                    = BCs/left                                          seed                         = 0                                                 value                        = 0                                               [../]                                                                                                                                                             [./right]                                                                          boundary                     = right                                             type                         = PostprocessorDirichletBC                          use_displaced_mesh           = 0                                                 variable                     = u                                                 long_name                    = BCs/right                                         postprocessor                = master_value                                      seed                         = 0                                               [../]                                                                          []                                                                                                                                                                [Executioner]                                                                      type                           = Transient                                       l_abs_step_tol                 = -1                                              l_max_its                      = 10000                                           l_tol                          = 1e-05                                           line_search                    = default                                         nl_abs_step_tol                = 1e-50                                           nl_abs_tol                     = 1e-50                                           nl_max_funcs                   = 10000                                           nl_max_its                     = 50                                              nl_rel_step_tol                = 1e-50                                           nl_rel_tol                     = 1e-08                                           no_fe_reinit                   = 0                                               petsc_options                  =                                                 petsc_options_iname            = '-pc_type -pc_hypre_type'                       petsc_options_value            = 'hypre boomeramg'                               solve_type                     = PJFNK                                           abort_on_solve_fail            = 0                                               dt                             = 0.1                                             dtmax                          = 1e+30                                           dtmin                          = 2e-14                                           end_time                       = 1e+30                                           long_name                      = Executioner                                     n_startup_steps                = 0                                               num_steps                      = 20                                              picard_abs_tol                 = 1e-50                                           picard_max_its                 = 1                                               picard_rel_tol                 = 1e-08                                           predictor_scale                = INVALID                                         reset_dt                       = 0                                               restart_file_base              = INVALID                                         scheme                         = implicit-euler                                  splitting                      = INVALID                                         ss_check_tol                   = 1e-08                                           ss_tmin                        = 0                                               start_time                     = 0                                               time_period_ends               = INVALID                                         time_period_starts             = INVALID                                         time_periods                   = INVALID                                         timestep_tolerance             = 2e-14                                           trans_ss_check                 = 0                                               use_multiapp_dt                = 0                                               verbose                        = 0                                             []                                                                                                                                                                [Executioner]                                                                      _fe_problem                    = 0x7f90450b5a00                                []                                                                                                                                                                [Kernels]                                                                                                                                                           [./diff]                                                                           type                         = CoefDiffusion                                     block                        = INVALID                                           coef                         = 0.1                                               diag_save_in                 = INVALID                                           long_name                    = Kernels/diff                                      save_in                      = INVALID                                           seed                         = 0                                                 use_displaced_mesh           = 0                                                 variable                     = u                                               [../]                                                                                                                                                             [./time]                                                                           type                         = TimeDerivative                                    block                        = INVALID                                           diag_save_in                 = INVALID                                           long_name                    = Kernels/time                                      lumping                      = 0                                                 save_in                      = INVALID                                           seed                         = 0                                                 use_displaced_mesh           = 0                                                 variable                     = u                                               [../]                                                                          []                                                                                                                                                                [Mesh]                                                                             displacements                  = INVALID                                         block_id                       = INVALID                                         block_name                     = INVALID                                         boundary_id                    = INVALID                                         boundary_name                  = INVALID                                         construct_side_list_from_node_list = 0                                           ghosted_boundaries             = INVALID                                         ghosted_boundaries_inflation   = INVALID                                         patch_size                     = 40                                              second_order                   = 0                                               type                           = GeneratedMesh                                   uniform_refine                 = 0                                               centroid_partitioner_direction = INVALID                                         dim                            = 1                                               distribution                   = DEFAULT                                         elem_type                      = INVALID                                         long_name                      = Mesh                                            nemesis                        = 0                                               nx                             = 10                                              ny                             = 1                                               nz                             = 1                                               partitioner                    = default                                         xmax                           = 0                                               xmin                           = -1                                              ymax                           = 1                                               ymin                           = 0                                               zmax                           = 1                                               zmin                           = 0                                             []                                                                                                                                                                [Outputs]                                                                          checkpoint                     = 0                                               color                          = 1                                               console                        = 0                                               csv                            = 0                                               exodus                         = 1                                               file_base                      = INVALID                                         gmv                            = 0                                               gnuplot                        = 0                                               hide                           = INVALID                                         interval                       = 1                                               nemesis                        = 0                                               output_final                   = 0                                               output_if_base_contains        = INVALID                                         output_initial                 = 1                                               output_intermediate            = 1                                               show                           = INVALID                                         solution_history               = 0                                               sync_times                     =                                                 tecplot                        = 0                                               vtk                            = 0                                               xda                            = 0                                               xdr                            = 0                                                                                                                                [./console]                                                                        type                         = Console                                           all_variable_norms           = 0                                                 append_displaced             = 0                                                 append_restart               = 0                                                 end_time                     = INVALID                                           file_base                    = INVALID                                           fit_mode                     = ENVIRONMENT                                       hide                         = INVALID                                           interval                     = 1                                                 linear_residual_dt_divisor   = 1000                                              linear_residual_end_time     = INVALID                                           linear_residual_start_time   = INVALID                                           linear_residuals             = 1                                                 long_name                    = Outputs/console                                   max_rows                     = 15                                                nonlinear_residual_dt_divisor = 1000                                             nonlinear_residual_end_time  = INVALID                                           nonlinear_residual_start_time = INVALID                                          nonlinear_residuals          = 1                                                 outlier_multiplier           = '0.8 2'                                           outlier_variable_norms       = 1                                                 output_failed                = 1                                                 output_file                  = 0                                                 output_final                 = 0                                                 output_if_base_contains      = INVALID                                           output_initial               = 1                                                 output_intermediate          = 1                                                 output_postprocessors        = 1                                                 output_scalar_variables      = 1                                                 output_screen                = 1                                                 output_system_information    = 1                                                 padding                      = 4                                                 perf_header                  = INVALID                                           perf_log                     = 1                                                 scientific_time              = 0                                                 sequence                     = INVALID                                           setup_log                    = INVALID                                           setup_log_early              = 0                                                 show                         = INVALID                                           show_multiapp_name           = 0                                                 solve_log                    = INVALID                                           start_time                   = INVALID                                           sync_only                    = 0                                                 sync_times                   =                                                   time_precision               = INVALID                                           time_tolerance               = 1e-14                                             use_displaced                = 0                                                 verbose                      = 0                                               [../]                                                                                                                                                             [./exodus]                                                                         type                         = Exodus                                            append_displaced             = 0                                                 append_oversample            = 0                                                 elemental_as_nodal           = 0                                                 end_time                     = INVALID                                           file                         = INVALID                                           file_base                    = INVALID                                           hide                         = INVALID                                           interval                     = 1                                                 linear_residual_dt_divisor   = 1000                                              linear_residual_end_time     = INVALID                                           linear_residual_start_time   = INVALID                                           linear_residuals             = 0                                                 long_name                    = Outputs/exodus                                    nonlinear_residual_dt_divisor = 1000                                             nonlinear_residual_end_time  = INVALID                                           nonlinear_residual_start_time = INVALID                                          nonlinear_residuals          = 0                                                 output_elemental_variables   = 1                                                 output_failed                = 0                                                 output_final                 = 0                                                 output_if_base_contains      = INVALID                                           output_initial               = 1                                                 output_input                 = 1                                                 output_intermediate          = 1                                                 output_nodal_variables       = 1                                                 output_postprocessors        = 1                                                 output_scalar_variables      = 1                                                 output_system_information    = 1                                                 oversample                   = 0                                                 padding                      = 3                                                 position                     = INVALID                                           refinements                  = 0                                                 scalar_as_nodal              = 0                                                 sequence                     = INVALID                                           show                         = INVALID                                           start_time                   = INVALID                                           sync_only                    = 0                                                 sync_times                   =                                                   time_tolerance               = 1e-14                                             use_displaced                = 0                                               [../]                                                                          []                                                                                                                                                                [Postprocessors]                                                                                                                                                    [./master_value]                                                                   type                         = Receiver                                          default                      = INVALID                                           execute_on                   = timestep_begin                                    long_name                    = Postprocessors/master_value                       outputs                      = INVALID                                           use_displaced_mesh           = 0                                               [../]                                                                          []                                                                                                                                                                [Variables]                                                                                                                                                         [./u]                                                                              block                        = INVALID                                           eigen                        = 0                                                 family                       = LAGRANGE                                          initial_condition            = 0                                                 order                        = FIRST                                             scaling                      = 1                                                 initial_from_file_timestep   = 2                                                 initial_from_file_var        = INVALID                                         [../]                                                                          []                                                                                                                                                                                          ?�������        ?�Y:�_�?3�z�TL�?L����N�?dk�B��?}l~�p�?��Eỉ�?��a��O?���?�	?��}8;?�UUSq��?�UUUU[�?ə�����        ?B� F�S?[�i���?q�(���2?���Mv5?�<�;�B[?� ��k��?�$��D�?֢Q*#�?���f�?�UUUUUR?�UUUUUR?�333334        ?^D2]H?t�ĈI(�?����<e?� �'z�?��,*l�?�u�+ϙ ?Ыy ��I?߬&�bv?��:yKj?�UUUUUV?�UUUUUV?ٙ�����        ?qU���Z?�����/�?���(*�?�����?��tN/�?ȼ�l!\?�j�YZ�?��١�?��&-�`"?�UUUUUV?�UUUUUV?�              ?�0F�?�+&1��\?����?b?�����?�d߆�?�I/pZ�?�1v���?�[q���?�Q���.?�UUUUUV?�UUUUUV