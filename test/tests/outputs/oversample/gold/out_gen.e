CDF      
      
len_string     !   len_line   Q   four      	time_step          len_name   !   num_dim       	num_nodes         num_elem   	   
num_el_blk        num_node_sets         num_side_sets         num_el_in_blk1     	   num_nod_per_el1       num_side_ss1      
num_df_ss1        num_side_ss2      
num_df_ss2        num_side_ss3      
num_df_ss3        num_side_ss4      
num_df_ss4        num_nod_ns1       num_nod_ns2       num_nod_ns3       num_nod_ns4       num_nod_var       num_info   �   num_glo_var             api_version       @��H   version       @��H   floating_point_word_size            	file_size               title         out.e      maximum_name_length                 $   
time_whole                        Jd   	eb_status                         	p   eb_prop1               name      ID          	t   	ns_status         	                	x   ns_prop1      	         name      ID          	�   	ss_status         
                	�   ss_prop1      
         name      ID          	�   coordx                      �  	�   coordy                      �  
8   eb_names                       $  
�   ns_names      	                 �  
�   ss_names      
                 �  `   
coor_names                         D  �   connect1                  	elem_type         QUAD4         �  (   elem_num_map                    $  �   elem_ss1                      �   side_ss1                      �   dist_fact_ss1                          �   elem_ss2                         side_ss2                          dist_fact_ss2                          ,   elem_ss3                      L   side_ss3                      X   dist_fact_ss3                          d   elem_ss4                      �   side_ss4                      �   dist_fact_ss4                          �   node_ns1                      �   node_ns2                      �   node_ns3                      �   node_ns4                      �   vals_nod_var1                          �  Jl   name_nod_var                       $  �   info_records                      <       name_glo_var                       $  J@   vals_glo_var                         J�                                                         ��      ��UUUUUO��UUUUUO��      ?�UUUUUO?�UUUUUO?�      ?�      ��UUUUUO��      ?�UUUUUO?�      ��UUUUUO��      ?�UUUUUO?�      ��      ��      ��UUUUUO��UUUUUO��      ��UUUUUO��      ��UUUUUO?�UUUUUO?�UUUUUO?�UUUUUO?�UUUUUO?�      ?�      ?�      ?�                                                                                                                                                                                                                                                                                                                                                                                                                                   	   
            	               
   	         	                                                	                                                                                                             	                                                  	                                                              
                           u                                   ####################                                                             # Created by MOOSE #                                                             ####################                                                             ### Command Line Arguments ###                                                   -i                                                                               over_sampling_test.i                                                                                                                                              ### Input File ###                                                                                                                                                                                                                                 [Mesh]                                                                             second_order                   = 0                                               file                           = '(no file supplied)'                            nemesis                        = 0                                               patch_size                     = 40                                              skip_partitioning              = 0                                               uniform_refine                 = 0                                                                                                                                [./Generation]                                                                     dim                          = 2                                                 nx                           = 3                                                 ny                           = 3                                                 nz                           = 1                                                 xmax                         = 1                                                 xmin                         = -1                                                ymax                         = 1                                                 ymin                         = -1                                                zmax                         = 1                                                 zmin                         = 0                                               [../]                                                                          []                                                                                                                                                                [Functions]                                                                        [./exact_fn]                                                                       type                         = ParsedFunction                                    execute_on                   = residual                                          vals                         =                                                   value                        = t*((x*x)+(y*y))                                   vars                         =                                                 [../]                                                                                                                                                             [./forcing_fn]                                                                     type                         = ParsedFunction                                    execute_on                   = residual                                          vals                         =                                                   value                        = -4+(x*x+y*y)                                      vars                         =                                                 [../]                                                                          []                                                                                                                                                                [Variables]                                                                        [./u]                                                                              family                       = HERMITE                                           initial_condition            = 0                                                 order                        = THIRD                                             scaling                      = 1                                                 initial_from_file_timestep   = 2                                               [../]                                                                          []                                                                                                                                                                [Kernels]                                                                          [./ie]                                                                             type                         = TimeDerivative                                    execute_on                   = residual                                          start_time                   = -1.79769e+308                                     stop_time                    = 1.79769e+308                                      variable                     = u                                               [../]                                                                                                                                                             [./diff]                                                                           type                         = Diffusion                                         execute_on                   = residual                                          start_time                   = -1.79769e+308                                     stop_time                    = 1.79769e+308                                      variable                     = u                                               [../]                                                                                                                                                             [./ffn]                                                                            type                         = UserForcingFunction                               execute_on                   = residual                                          function                     = forcing_fn                                        start_time                   = -1.79769e+308                                     stop_time                    = 1.79769e+308                                      variable                     = u                                               [../]                                                                          []                                                                                                                                                                [BCs]                                                                              [./all]                                                                            type                         = FunctionDirichletBC                               boundary                     = '0 1 2 3'                                         execute_on                   = residual                                          function                     = exact_fn                                          variable                     = u                                               [../]                                                                          []                                                                                                                                                                [Postprocessors]                                                                   [./dt]                                                                             type                         = PrintDT                                           execute_on                   = residual                                          output                       = 1                                               [../]                                                                          []                                                                                                                                                                [Executioner]                                                                      l_abs_step_tol                 = -1                                              l_max_its                      = 10000                                           l_tol                          = 1e-05                                           nl_abs_step_tol                = 1e-50                                           nl_abs_tol                     = 1e-50                                           nl_max_funcs                   = 10000                                           nl_max_its                     = 50                                              nl_rel_step_tol                = 1e-50                                           nl_rel_tol                     = 1e-08                                           no_fe_reinit                   = 0                                               petsc_options                  = -snes_mf_operator                               scheme                         = backward-euler                                  type                           = Transient                                       dt                             = 0.2                                             dtmax                          = 1e+30                                           dtmin                          = 0                                               end_time                       = 1e+30                                           execute_on                     = residual                                        n_startup_steps                = 0                                               num_steps                      = 5                                               ss_check_tol                   = 1e-08                                           ss_tmin                        = 0                                               start_time                     = 0                                               sync_times                     = -1                                              trans_ss_check                 = 0                                             []                                                                                                                                                                [Output]                                                                           exodus                         = 1                                               file_base                      = out                                             gmv                            = 0                                               gnuplot_format                 = ps                                              interval                       = 1                                               iteration_plot_start_time      = 1.79769e+308                                    nemesis                        = 0                                               output_displaced               = 0                                               output_initial                 = 1                                               perf_log                       = 1                                               postprocessor_csv              = 0                                               postprocessor_ensight          = 0                                               postprocessor_gnuplot          = 0                                               postprocessor_screen           = 1                                               print_linear_residuals         = 0                                               show_setup_log_early           = 0                                               tecplot                        = 0                                               tecplot_binary                 = 0                                               xda                            = 0                                                                                                                                [./OverSampling]                                                                   exodus                       = 1                                                 gmv                          = 0                                                 interval                     = 1                                                 iteration_plot_start_time    = 1.79769e+308                                      nemesis                      = 0                                                 output_initial               = 1                                                 refinements                  = 3                                                 tecplot                      = 0                                                 tecplot_binary               = 0                                                 xda                          = 0                                               [../]                                                                          []                                                                                                                                                                [copy_nodal_vars]                                                                  initial_from_file_timestep     = 2                                             []                                                                                                                                                                [init_problem]                                                                   []                                                                                                                                                                [check_integrity]                                                                []                                                                                                                                                                [no_action]                                                                      []                                                                                                                                                                [setup_dampers]                                                                  []                                                                                                                                                                [setup_quadrature]                                                                 order                          = AUTO                                            type                           = GAUSS                                         []                                                                                                                                                                [no_action]                                                                        dt                                                                                                                                                                                  ?ə�����?ٙ���(`?�q�qA���v�
�b�?�q�qA�?�q�qA���v�
�L�?ٙ���(N?�q�qA���v�
�)�?�q�qAͿ�v�
��s?�q�qA�?�q�qA�?ٙ���(r?�q�qA�?ٙ���(N?ə�����?ٙ�����?陙���W?�q�q���VT�Ì?�q�q�?�q�q���VT����?陙���E?�q�q���VT��}0?�q�q���VT��0Y?�q�q�?�q�q�?陙���`?�q�q�?陙���E?ə�����?�333333?�3333.F?�UUUU^�������?�UUUU^�?�UUUU^������?�3333.?�UUUU^�����#�?�UUUU^�����C�?�UUUU^�?�UUUU^�?�3333.F?�UUUU^�?�3333.?ə�����?陙����?�������?�q�q�1�׀�/�"P?�q�q�:?�q�q�1�׀�/�]�?�������?�q�q�1�׀�/�n<?�q�q�:�׀�/�Mr?�q�q�1?�q�q�:?�������?�q�q�:?�������?ə�����?�      ?�������?��q�\�ɴë9�?��q�\?��q�\�ɴêLa?�������?��q�\�ɴê�?��q�\�ɴêG?��q�\?��q�\?�������?��q�\?�������?ə�����