CDF      
      
len_string     !   len_line   Q   four      	time_step          len_name   !   num_dim       	num_nodes      A   num_elem      
num_el_blk        num_node_sets         num_side_sets         num_el_in_blk1        num_nod_per_el1       num_side_ss1      num_side_ss2      num_side_ss3      num_side_ss4      num_nod_ns1    	   num_nod_ns2    	   num_nod_ns3    	   num_nod_ns4    	   num_nod_var       num_info  )         api_version       @�
=   version       @�
=   floating_point_word_size            	file_size               int64_status             title         boundary_tomaster_master_out.e     maximum_name_length                     
time_whole                            q\   	eb_status                             	    eb_prop1               name      ID              	   	ns_status         	                    	   ns_prop1      	         name      ID              	   	ss_status         
                    	(   ss_prop1      
         name      ID              	8   coordx                           	H   coordy                           P   eb_names                       $      X   ns_names      	                 �      |   ss_names      
                 �          
coor_names                         D      �   node_num_map                         �   connect1                  	elem_type         QUAD8               �   elem_num_map                    @      �   elem_ss1                             side_ss1                             elem_ss2                          ,   side_ss2                          <   elem_ss3                          L   side_ss3                          \   elem_ss4                          l   side_ss4                          |   node_ns1                    $      �   node_ns2                    $      �   node_ns3                    $      �   node_ns4                    $      �   vals_nod_var1                               qd   vals_nod_var2                               sl   name_nod_var                       D         info_records                      ]�      `                                                                 ?�      ?�              ?�      ?�      ?�              ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�              ?�      ?�              ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�              ?�      ?�              ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�              ?�      ?�              ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�                      ?�      ?�              ?�      ?�      ?�              ?�              ?�      ?�              ?�              ?�      ?�              ?�              ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�                                          bottom                           right                            left                             top                              bottom                           left                             right                            top                                                                                                                             	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?   @   A                              	   
                  	         
                                                                  
                     
                !   "            #          $   %   !         &   '      (   )   *         +   &      ,   -   (          .   +   "   /   0   ,       #   1   .   %   2   3   /   '   &   4   5   )   6   7   8   &   +   9   4   -   :   ;   6   +   .   <   9   0   =   >   :   .   1   ?   <   3   @   A   =                           	   
                                                   	                                                                                    	                  $   #   @   1   2   ?   8            *         5   '   5   7   4   ;   9   >   <   A   ?from_sub                         u                                  ####################                                                             # Created by MOOSE #                                                             ####################                                                             ### Command Line Arguments ###                                                   -i                                                                               boundary_tomaster_master.i                                                                                                                                        ### Version Info ###                                                             Framework Information:                                                           MOOSE version:           git commit 2f8e838 on 2016-01-12                        PETSc Version:           3.6.0                                                   Current Time:            Wed Jan 13 10:12:36 2016                                Executable Timestamp:    Tue Jan 12 16:57:20 2016                                                                                                                                                                                                  ### Input File ###                                                                                                                                                []                                                                                 block                          = INVALID                                         coord_type                     = XYZ                                             fe_cache                       = 0                                               kernel_coverage_check          = 1                                               material_coverage_check        = 1                                               name                           = 'MOOSE Problem'                                 restart_file_base              = INVALID                                         rz_coord_axis                  = Y                                               type                           = FEProblem                                       use_legacy_uo_aux_computation  = INVALID                                         use_legacy_uo_initialization   = INVALID                                         element_order                  = AUTO                                            order                          = AUTO                                            side_order                     = AUTO                                            active_bcs                     = INVALID                                         active_kernels                 = INVALID                                         inactive_bcs                   = INVALID                                         inactive_kernels               = INVALID                                         start                          = 0                                               control_tags                   = INVALID                                         dimNearNullSpace               = 0                                               dimNullSpace                   = 0                                               enable                         = 1                                               error_on_jacobian_nonzero_reallocation = 0                                       petsc_inames                   =                                                 petsc_options                  = INVALID                                         petsc_values                   =                                                 solve                          = 1                                               use_nonlinear                  = 1                                             []                                                                                                                                                                [AuxVariables]                                                                                                                                                      [./from_sub]                                                                       block                        = INVALID                                           family                       = LAGRANGE                                          initial_condition            = INVALID                                           order                        = SECOND                                            outputs                      = INVALID                                           initial_from_file_timestep   = LATEST                                            initial_from_file_var        = INVALID                                         [../]                                                                          []                                                                                                                                                                [BCs]                                                                                                                                                               [./bottom]                                                                         boundary                     = bottom                                            control_tags                 = INVALID                                           enable                       = 1                                                 implicit                     = 1                                                 type                         = DirichletBC                                       use_displaced_mesh           = 0                                                 variable                     = u                                                 diag_save_in                 = INVALID                                           save_in                      = INVALID                                           seed                         = 0                                                 value                        = 0                                               [../]                                                                                                                                                             [./top]                                                                            boundary                     = top                                               control_tags                 = INVALID                                           enable                       = 1                                                 implicit                     = 1                                                 type                         = DirichletBC                                       use_displaced_mesh           = 0                                                 variable                     = u                                                 diag_save_in                 = INVALID                                           save_in                      = INVALID                                           seed                         = 0                                                 value                        = 2                                               [../]                                                                          []                                                                                                                                                                [Executioner]                                                                      type                           = Transient                                       abort_on_solve_fail            = 0                                               compute_initial_residual_before_preset_bcs = 0                                   control_tags                   =                                                 dt                             = 1                                               dtmax                          = 1e+30                                           dtmin                          = 2e-14                                           enable                         = 1                                               end_time                       = 1e+30                                           l_abs_step_tol                 = -1                                              l_max_its                      = 10000                                           l_tol                          = 1e-05                                           line_search                    = default                                         n_startup_steps                = 0                                               nl_abs_step_tol                = 1e-50                                           nl_abs_tol                     = 1e-50                                           nl_max_funcs                   = 10000                                           nl_max_its                     = 50                                              nl_rel_step_tol                = 1e-50                                           nl_rel_tol                     = 1e-08                                           no_fe_reinit                   = 0                                               num_steps                      = 1                                               petsc_options                  = INVALID                                         petsc_options_iname            = '-PC_HYPRE_TYPE -PC_TYPE'                       petsc_options_value            = 'hypre boomeramg'                               picard_abs_tol                 = 1e-50                                           picard_max_its                 = 1                                               picard_rel_tol                 = 1e-08                                           reset_dt                       = 0                                               restart_file_base              =                                                 scheme                         = INVALID                                         solve_type                     = PJFNK                                           splitting                      = INVALID                                         ss_check_tol                   = 1e-08                                           ss_tmin                        = 0                                               start_time                     = 0                                               time_period_ends               = INVALID                                         time_period_starts             = INVALID                                         time_periods                   = INVALID                                         timestep_tolerance             = 2e-14                                           trans_ss_check                 = 0                                               use_multiapp_dt                = 0                                               verbose                        = 0                                             []                                                                                                                                                                [Executioner]                                                                      _fe_problem                    = 0x7fca23014e00                                []                                                                                                                                                                [Kernels]                                                                                                                                                           [./diff]                                                                           type                         = Diffusion                                         block                        = INVALID                                           control_tags                 = Kernels                                           diag_save_in                 = INVALID                                           enable                       = 1                                                 implicit                     = 1                                                 save_in                      = INVALID                                           seed                         = 0                                                 use_displaced_mesh           = 0                                                 variable                     = u                                               [../]                                                                          []                                                                                                                                                                [Mesh]                                                                             displacements                  = INVALID                                         block_id                       = INVALID                                         block_name                     = INVALID                                         boundary_id                    = INVALID                                         boundary_name                  = INVALID                                         construct_side_list_from_node_list = 0                                           ghosted_boundaries             = INVALID                                         ghosted_boundaries_inflation   = INVALID                                         patch_size                     = 40                                              second_order                   = 0                                               skip_partitioning              = 0                                               type                           = GeneratedMesh                                   uniform_refine                 = 0                                               bias_x                         = 1                                               bias_y                         = 1                                               bias_z                         = 1                                               centroid_partitioner_direction = INVALID                                         control_tags                   =                                                 dim                            = 2                                               distribution                   = DEFAULT                                         elem_type                      = QUAD8                                           enable                         = 1                                               nemesis                        = 0                                               nx                             = 4                                               ny                             = 4                                               nz                             = 1                                               partitioner                    = default                                         patch_update_strategy          = never                                           xmax                           = 1                                               xmin                           = 0                                               ymax                           = 1                                               ymin                           = 0                                               zmax                           = 1                                               zmin                           = 0                                             []                                                                                                                                                                [Mesh]                                                                           []                                                                                                                                                                [MultiApps]                                                                                                                                                         [./sub]                                                                            type                         = TransientMultiApp                                 app_type                     = MooseTestApp                                      bounding_box_inflation       = 0.01                                              catch_up                     = 0                                                 control_tags                 = MultiApps                                         detect_steady_state          = 0                                                 enable                       = 1                                                 execute_on                   = TIMESTEP_BEGIN                                    implicit                     = 1                                                 input_files                  = boundary_tomaster_sub.i                           interpolate_transfers        = 0                                                 library_path                 =                                                   max_catch_up_steps           = 2                                                 max_failures                 = 0                                                 max_procs_per_app            = 4294967295                                        move_apps                    = INVALID                                           move_positions               = INVALID                                           move_time                    = 1.79769e+308                                      output_in_position           = 0                                                 output_sub_cycles            = 0                                                 positions                    = '(x,y,z)=(       0,        0,        0)'          positions_file               = INVALID                                           print_sub_cycles             = 1                                                 reset_apps                   = INVALID                                           reset_time                   = 1.79769e+308                                      steady_state_tol             = 1e-08                                             sub_cycling                  = 0                                                 tolerate_failure             = 0                                                 use_displaced_mesh           = 0                                               [../]                                                                          []                                                                                                                                                                [Outputs]                                                                          append_date                    = 0                                               append_date_format             = INVALID                                         checkpoint                     = 0                                               color                          = 1                                               console                        = 1                                               csv                            = 0                                               dofmap                         = 0                                               execute_on                     = 'INITIAL TIMESTEP_END'                          exodus                         = 1                                               file_base                      = INVALID                                         gmv                            = 0                                               gnuplot                        = 0                                               hide                           = INVALID                                         interval                       = 1                                               nemesis                        = 0                                               output_if_base_contains        = INVALID                                         print_linear_residuals         = 1                                               print_mesh_changed_info        = 0                                               print_perf_log                 = 0                                               show                           = INVALID                                         solution_history               = 0                                               sync_times                     =                                                 tecplot                        = 0                                               vtk                            = 0                                               xda                            = 0                                               xdr                            = 0                                             []                                                                                                                                                                [Transfers]                                                                                                                                                         [./from_sub]                                                                       type                         = MultiAppNearestNodeTransfer                       control_tags                 = Transfers                                         direction                    = from_multiapp                                     displaced_source_mesh        = 0                                                 displaced_target_mesh        = 0                                                 enable                       = 1                                                 execute_on                   = SAME_AS_MULTIAPP                                  fixed_meshes                 = 0                                                 multi_app                    = sub                                               source_boundary              = right                                             source_variable              = u                                                 target_boundary              = left                                              use_displaced_mesh           = 0                                                 variable                     = from_sub                                        [../]                                                                          []                                                                                                                                                                [Variables]                                                                                                                                                         [./u]                                                                              block                        = INVALID                                           eigen                        = 0                                                 family                       = LAGRANGE                                          initial_condition            = INVALID                                           order                        = FIRST                                             outputs                      = INVALID                                           scaling                      = 1                                                 initial_from_file_timestep   = LATEST                                            initial_from_file_var        = INVALID                                         [../]                                                                          []                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ?�      ?�     	                ?������                        ?������y                                                                                                                                ?������                ?�������                                                                                ?������,                ?������d                                                                                                        ?������E                                                                                        ?�����|;?�����g�        ?�����|;?�����r?�����g�        ?�������        ?�������?�������        ?�����}O        ?�����}O?�����%        ?�    3�        ?�    3�?������?�����K�?������I?�����D�?�����"?�����?�����wk?�����kt?�����a�?�����z\?�������?�����x�?������X?�    	�?�������?�������?������?�������?������Y?�������?�������?������?������?�����{R?������@?�������?�����q�?�������?�����v�@      g@      g?������@@      g?�������@      g?�����Ӭ@      g@      g?������@      g@      g?������J@      g