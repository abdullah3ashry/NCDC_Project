##############################################################################################################
#####  
#####                                         PVS LVS COMPARISON
#####  
#####  Version                       :   23.11-s036
#####  NVN Run Start                 :   Tue Aug 11 08:35:10 2026
#####  ERC Summary File              :   erc.sum
#####  Extraction Report File        :   lvs.rep
#####  Comparison Report File        :   lvs.rep.cls
#####  Top Cell                      :   counter  <vs>  counter
#####  
#####  Run Result                    :   MATCH
#####  
#####  Run Summary                   :   [INFO]  ERC Results: Empty, non-executed ERC operations exist (refer to ERC Summary File)
#####                                :   [INFO]  Extraction Clean
#####  
#####  Layout Design                 :   /home/cc/Documents/Abdullah/Lab01_Materials/Lab01_Data/export/Innovus_Data/outputs/pnr/counter.gds (gdsii)
#####  Layout File                   :   counter.net (cdl)
#####  Schematic File                :   /home/cc/Documents/Abdullah/Lab01_Materials/Lab01_Data/export/Innovus_Data/outputs/pnr/counter.final.v (verilog)
#####  Schematic File                :   /home/cc/Documents/Abdullah/Lab01_Materials/Lab01_Data/libraries/spi/tcbn65lp_200a.spi (cdl)
#####  Rules File                    :   /home/cc/Documents/Abdullah/Lab01_Materials/Lab01_Data/inputs/lvs.pvl
#####  Pin Swap File                 :   lvs.rep.cps
#####  
#####  Extraction CPU Time           :   0h 0m 0s - (0s)
#####  Extraction Exec Time          :   0h 0m 3s - (3s)
#####  Extraction Peak Memory Usage  :   35.00MB
#####  NVN CPU Time                  :   0h 0m 0s - (0s)                 
#####  NVN Exec Time                 :   0h 0m 1s - (1s)                 
#####  NVN Peak Memory Usage         :   373.45MB
#####  LVS Total CPU Time            :   0h 0m 0s - (0s)                 
#####  LVS Total Exec Time           :   0h 0m 4s - (4s)                 
#####  LVS Total Peak Memory Usage   :   373.45MB
#####  
##############################################################################################################


##############################################################################################################
#
#                                            CELL MATCH STATISTICS                                            
#
##############################################################################################################

Cell Statistic Descriptions                  | Count
---------------------------------------------+----------
Cells matched                                |         1
Cells expanded                               |         0
Cells not run                                |         0
Cells which mismatch                         |         0
---------------------------------------------+----------
Total                                        |         1


Cell Statistic Detail                        | Count
---------------------------------------------+----------
Cells with parameter mismatches              |         0
Cells with mismatched instance subtypes      |         0
Cells that have been blackboxed              |         0


##############################################################################################################
#
#                                             CELL MATCH SUMMARY                                              
#
##############################################################################################################

            |     Initial Pins     |     Compare Pins     |            | 
Cell        |   lay    :    sch    |   lay    :    sch    | Status     | Detail
------------+----------+-----------+----------+-----------+------------+-----------
counter     |        6 :         6 |       *6 :         8 | match      | 


##############################################################################################################
#
#                                                  LVS RULES                                                  
#
##############################################################################################################

LVS Rules Given in the Rules File
---------------------------------

    lvs_abort                               -supply_error                          no  
    layout_path                             /home/cc/Documents/Abdullah/Lab01_Materials/Lab01_Data/export/Innovus_Data/outputs/pnr/counter.gds
    layout_format                           gdsii
    layout_format                           GDSII
    layout_primary                          counter
    layout_primary                          lvs_top
    schematic_path                          /home/cc/Documents/Abdullah/Lab01_Materials/Lab01_Data/export/Innovus_Data/outputs/pnr/counter.final.v
                                            verilog
    schematic_path                          /home/cc/Documents/Abdullah/Lab01_Materials/Lab01_Data/libraries/spi/tcbn65lp_200a.spi
                                            spice
    schematic_format                        SPICE
    schematic_primary                       counter
    lvs_delete_cell                         DCAP -layout
    lvs_delete_cell                         DCAP2 -layout
    lvs_delete_cell                         DCAP3 -layout
    lvs_delete_cell                         DCAP4 -layout
    lvs_delete_cell                         DCAP8 -layout
    lvs_delete_cell                         DCAP10 -layout
    lvs_delete_cell                         DCAP16 -layout
    lvs_delete_cell                         DCAP32 -layout
    lvs_delete_cell                         DCAP64 -layout
    lvs_delete_cell                         FILL1 -layout
    lvs_delete_cell                         FILL2 -layout
    lvs_delete_cell                         FILL3 -layout
    lvs_delete_cell                         FILL4 -layout
    lvs_delete_cell                         FILL8 -layout
    lvs_delete_cell                         FILL10 -layout
    lvs_delete_cell                         FILL16 -layout
    lvs_delete_cell                         FILL32 -layout
    lvs_delete_cell                         FILL64 -layout
    lvs_spice                               yes -prefer_pins
                                             
    lvs_power_name                          AHVDD AHVDDB AHVDDG AHVDDR AHVDDWELL AVDD AVDDB AVDDBG AVDDG AVDDR
                                            AVDWELL DHVDD DVDD HVDDWELL TACVDD TAVD33 TAVD33PST TAVDD TAVDDPST
                                            TVDD VD33 VDD VDD5V VDDESD VDDG VDDM VDDPST VDDSA VDWELL 
    lvs_ground_name                         AGND AHVSS AHVSSB AHVSSG AHVSSR AHVSSUB AVSS AVSSB AVSSBG AVSSG
                                            AVSSR AVSSUB DHVSS DVSS GND HVSSUB TACVSS TAVSS TAVSSPST TVSS VS33
                                            VSS VSSESD VSSG VSSM VSSPST VSSUB 
    lvs_device_type                         RESISTOR rm1 rm10 rm2 rm3 rm4 rm5 rm6 rm7 rm8 rm9 rnodl rnodl_m
                                            rnods rnods_m rnodwo rnodwo_m rnpolyl rnpolyl_m rnpolys rnpolys_m
                                            rnpolywo rnpolywo_m rnwod rnwod_m rnwsti rnwsti_m rpodl rpodl_m
                                            rpods rpods_m rpodwo rpodwo_m rppolyl rppolyl_m rppolyl_rf
                                            rppolyl_rf_rdk rppolys rppolys_m rppolys_rf rppolys_rf_rdk
                                            rppolywo rppolywo_m rppolywo_rf rppolywo_rf_rdk [ POS = PLUS NEG =
                                            MINUS ]
    lvs_all_cap_pins_swappable              yes 
    lvs_ignore_ports                        yes 
    lvs_compare_port_names                  yes 
    lvs_find_shorts                         yes 
    lvs_break_ambig_max                     65536
    lvs_filter_option                       AG RC RE RG -source_layout
    lvs_reduce_split_gates                  no  
    lvs_recognize_gates                     -none
    lvs_recognize_gates                     -NONE
    lvs_reduce                              yes -parallel_bipolar
    lvs_reduce                              yes -parallel_mos
    lvs_reduce                              yes -parallel_diodes
    lvs_reduce                              yes -parallel_caps
    lvs_reduce                              yes -parallel_resistors
    lvs_reduce                              yes -series_resistors
    lvs_reduce                              yes -series_caps
    lvs_reduce_device                       rm1 -parallel yes ...
    lvs_reduce_device                       rm1 -series PLUS MINUS yes ...
    lvs_reduce_device                       rm10 -PARALLEL YES ...
    lvs_reduce_device                       rm10 -SERIES PLUS MINUS YES ...
    lvs_reduce_device                       rm2 -parallel yes ...
    lvs_reduce_device                       rm2 -series PLUS MINUS yes ...
    lvs_reduce_device                       rm3 -parallel yes ...
    lvs_reduce_device                       rm3 -series PLUS MINUS yes ...
    lvs_reduce_device                       rm4 -parallel yes ...
    lvs_reduce_device                       rm4 -series PLUS MINUS yes ...
    lvs_reduce_device                       rm5 -parallel yes ...
    lvs_reduce_device                       rm5 -series PLUS MINUS yes ...
    lvs_reduce_device                       rm6 -parallel yes ...
    lvs_reduce_device                       rm6 -series PLUS MINUS yes ...
    lvs_reduce_device                       rm7 -parallel yes ...
    lvs_reduce_device                       rm7 -series PLUS MINUS yes ...
    lvs_reduce_device                       rm8 -parallel yes ...
    lvs_reduce_device                       rm8 -series PLUS MINUS yes ...
    lvs_reduce_device                       rm9 -parallel yes ...
    lvs_reduce_device                       rm9 -series PLUS MINUS yes ...
    lvs_reduce_device                       rnodl -parallel yes ...
    lvs_reduce_device                       rnodl -series PLUS MINUS yes ...
    lvs_reduce_device                       rnodl_m -parallel yes ...
    lvs_reduce_device                       rnodl_m -series PLUS MINUS yes ...
    lvs_reduce_device                       rnods -parallel yes ...
    lvs_reduce_device                       rnods -series PLUS MINUS yes ...
    lvs_reduce_device                       rnods_m -parallel yes ...
    lvs_reduce_device                       rnods_m -series PLUS MINUS yes ...
    lvs_reduce_device                       rnodwo -parallel yes ...
    lvs_reduce_device                       rnodwo -series PLUS MINUS yes ...
    lvs_reduce_device                       rnodwo_m -parallel yes ...
    lvs_reduce_device                       rnodwo_m -series PLUS MINUS yes ...
    lvs_reduce_device                       rnpolyl -parallel yes ...
    lvs_reduce_device                       rnpolyl -series PLUS MINUS yes ...
    lvs_reduce_device                       rnpolyl_m -parallel yes ...
    lvs_reduce_device                       rnpolyl_m -series PLUS MINUS yes ...
    lvs_reduce_device                       rnpolys -parallel yes ...
    lvs_reduce_device                       rnpolys -series PLUS MINUS yes ...
    lvs_reduce_device                       rnpolys_m -parallel yes ...
    lvs_reduce_device                       rnpolys_m -series PLUS MINUS yes ...
    lvs_reduce_device                       rnpolywo -parallel yes ...
    lvs_reduce_device                       rnpolywo -series PLUS MINUS yes ...
    lvs_reduce_device                       rnpolywo_m -parallel yes ...
    lvs_reduce_device                       rnpolywo_m -series PLUS MINUS yes ...
    lvs_reduce_device                       rnwod -parallel yes ...
    lvs_reduce_device                       rnwod -series PLUS MINUS yes ...
    lvs_reduce_device                       rnwod_m -parallel yes ...
    lvs_reduce_device                       rnwod_m -series PLUS MINUS yes ...
    lvs_reduce_device                       rnwsti -parallel yes ...
    lvs_reduce_device                       rnwsti -series PLUS MINUS yes ...
    lvs_reduce_device                       rnwsti_m -parallel yes ...
    lvs_reduce_device                       rnwsti_m -series PLUS MINUS yes ...
    lvs_reduce_device                       rpodl -parallel yes ...
    lvs_reduce_device                       rpodl -series PLUS MINUS yes ...
    lvs_reduce_device                       rpodl_m -parallel yes ...
    lvs_reduce_device                       rpodl_m -series PLUS MINUS yes ...
    lvs_reduce_device                       rpods -parallel yes ...
    lvs_reduce_device                       rpods -series PLUS MINUS yes ...
    lvs_reduce_device                       rpods_m -parallel yes ...
    lvs_reduce_device                       rpods_m -series PLUS MINUS yes ...
    lvs_reduce_device                       rpodwo -parallel yes ...
    lvs_reduce_device                       rpodwo -series PLUS MINUS yes ...
    lvs_reduce_device                       rpodwo_m -parallel yes ...
    lvs_reduce_device                       rpodwo_m -series PLUS MINUS yes ...
    lvs_reduce_device                       rppolyl -parallel yes ...
    lvs_reduce_device                       rppolyl -series PLUS MINUS yes ...
    lvs_reduce_device                       rppolyl_m -parallel yes ...
    lvs_reduce_device                       rppolyl_m -series PLUS MINUS yes ...
    lvs_reduce_device                       rppolys -parallel yes ...
    lvs_reduce_device                       rppolys -series PLUS MINUS yes ...
    lvs_reduce_device                       rppolys_m -parallel yes ...
    lvs_reduce_device                       rppolys_m -series PLUS MINUS yes ...
    lvs_reduce_device                       rppolywo -parallel yes ...
    lvs_reduce_device                       rppolywo -series PLUS MINUS yes ...
    lvs_reduce_device                       rppolywo_m -parallel yes ...
    lvs_reduce_device                       rppolywo_m -series PLUS MINUS yes ...
    lvs_reduce_device                       rppolyl_rf -PARALLEL NO 
    lvs_reduce_device                       rppolyl_rf -SERIES PLUS MINUS NO 
    lvs_reduce_device                       rppolyl_rf_rdk -PARALLEL NO 
    lvs_reduce_device                       rppolyl_rf_rdk -SERIES PLUS MINUS NO 
    lvs_reduce_device                       rppolys_rf -PARALLEL NO 
    lvs_reduce_device                       rppolys_rf -SERIES PLUS MINUS NO 
    lvs_reduce_device                       rppolys_rf_rdk -PARALLEL NO 
    lvs_reduce_device                       rppolys_rf_rdk -SERIES PLUS MINUS NO 
    lvs_reduce_device                       rppolywo_rf -PARALLEL NO 
    lvs_reduce_device                       rppolywo_rf -SERIES PLUS MINUS NO 
    lvs_reduce_device                       rppolywo_rf_rdk -PARALLEL NO 
    lvs_reduce_device                       rppolywo_rf_rdk -SERIES PLUS MINUS NO 
    lvs_expand_cell_on_error                no  
    lvs_check_property                      LDDP ( pch_hv25_spw ) L L -TOLERANCE 0
    lvs_check_property                      LDDP ( pch_hv25_spw ) W W -TOLERANCE 0
    lvs_check_property                      LDDN ( nch_hv25_snw ) L L -TOLERANCE 0
    lvs_check_property                      LDDN ( nch_hv25_snw ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nch ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nch ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nch_18 ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nch_18 ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nch_18_dnw ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nch_18_dnw ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nch_25 ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nch_25 ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nch_25_dnw ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nch_25_dnw ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nch_25_dnwod ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nch_25_dnwod ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nch_25_dnwud ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nch_25_dnwud ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nch_25od ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nch_25od ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nch_25od28 ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nch_25od28 ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nch_25od28_dnw ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nch_25od28_dnw ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nch_25ud ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nch_25ud ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nch_33 ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nch_33 ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nch_33_dnw ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nch_33_dnw ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nch_dnw ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nch_dnw ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nch_dnw_1tr ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nch_dnw_1tr ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nch_dnw_w ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nch_dnw_w ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nch_dnw_w_lvt ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nch_dnw_w_lvt ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nch_esd18 ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nch_esd18 ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nch_esd18_dnw ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nch_esd18_dnw ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nch_hvn ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nch_hvn ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nch_hvt ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nch_hvt ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nch_hvt_dnw ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nch_hvt_dnw ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nch_hvz ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nch_hvz ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nch_lpg ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nch_lpg ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nch_lpghvt ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nch_lpghvt ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nch_lpgna ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nch_lpgna ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nch_lvt ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nch_lvt ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nch_lvt_dnw ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nch_lvt_dnw ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nch_mlvt ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nch_mlvt ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nch_mlvt_dnw ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nch_mlvt_dnw ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nch_na ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nch_na ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nch_na18 ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nch_na18 ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nch_na25 ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nch_na25 ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nch_na25od ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nch_na25od ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nch_na25ud ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nch_na25ud ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nch_na33 ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nch_na33 ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nch_timer ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nch_timer ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nch_uhvt ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nch_uhvt ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nch_uhvt_dnw ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nch_uhvt_dnw ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nch_ulvt ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nch_ulvt ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nch_ulvt_dnw ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nch_ulvt_dnw ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nch_w ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nch_w ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nch_w_lvt ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nch_w_lvt ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nchpd_dphcsr ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nchpd_dphcsr ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nchpd_dpsr ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nchpd_dpsr ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nchpd_hvtdphcsr ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nchpd_hvtdphcsr ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nchpd_hvtdpsr ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nchpd_hvtdpsr ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nchpd_hvtsr ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nchpd_hvtsr ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nchpd_lpgdpsr ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nchpd_lpgdpsr ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nchpd_lpgsr ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nchpd_lpgsr ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nchpd_lpgtpsr ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nchpd_lpgtpsr ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nchpd_sr ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nchpd_sr ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nchpd_ulpdpsr ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nchpd_ulpdpsr ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nchpd_ulpsr ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nchpd_ulpsr ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nchpd_wisr ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nchpd_wisr ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nchpd_wosr ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nchpd_wosr ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nchpg_dphcsr ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nchpg_dphcsr ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nchpg_dpsr ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nchpg_dpsr ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nchpg_hvtdphcsr ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nchpg_hvtdphcsr ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nchpg_hvtdpsr ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nchpg_hvtdpsr ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nchpg_hvtsr ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nchpg_hvtsr ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nchpg_lpgdpsr ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nchpg_lpgdpsr ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nchpg_lpgsr ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nchpg_lpgsr ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nchpg_lpgtpsr ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nchpg_lpgtpsr ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nchpg_sr ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nchpg_sr ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nchpg_ulpdpsr ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nchpg_ulpdpsr ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nchpg_ulpsr ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nchpg_ulpsr ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nchpg_wisr ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nchpg_wisr ) W W -TOLERANCE 0
    lvs_check_property                      MN ( nchpg_wosr ) L L -TOLERANCE 0
    lvs_check_property                      MN ( nchpg_wosr ) W W -TOLERANCE 0
    lvs_check_property                      MP ( pch ) L L -TOLERANCE 0
    lvs_check_property                      MP ( pch ) W W -TOLERANCE 0
    lvs_check_property                      MP ( pch_18 ) L L -TOLERANCE 0
    lvs_check_property                      MP ( pch_18 ) W W -TOLERANCE 0
    lvs_check_property                      MP ( pch_25 ) L L -TOLERANCE 0
    lvs_check_property                      MP ( pch_25 ) W W -TOLERANCE 0
    lvs_check_property                      MP ( pch_25od ) L L -TOLERANCE 0
    lvs_check_property                      MP ( pch_25od ) W W -TOLERANCE 0
    lvs_check_property                      MP ( pch_25od28 ) L L -TOLERANCE 0
    lvs_check_property                      MP ( pch_25od28 ) W W -TOLERANCE 0
    lvs_check_property                      MP ( pch_25ud ) L L -TOLERANCE 0
    lvs_check_property                      MP ( pch_25ud ) W W -TOLERANCE 0
    lvs_check_property                      MP ( pch_33 ) L L -TOLERANCE 0
    lvs_check_property                      MP ( pch_33 ) W W -TOLERANCE 0
    lvs_check_property                      MP ( pch_edc ) L L -TOLERANCE 0
    lvs_check_property                      MP ( pch_edc ) W W -TOLERANCE 0
    lvs_check_property                      MP ( pch_hvp ) L L -TOLERANCE 0
    lvs_check_property                      MP ( pch_hvp ) W W -TOLERANCE 0
    lvs_check_property                      MP ( pch_hvt ) L L -TOLERANCE 0
    lvs_check_property                      MP ( pch_hvt ) W W -TOLERANCE 0
    lvs_check_property                      MP ( pch_lpg ) L L -TOLERANCE 0
    lvs_check_property                      MP ( pch_lpg ) W W -TOLERANCE 0
    lvs_check_property                      MP ( pch_lpghvt ) L L -TOLERANCE 0
    lvs_check_property                      MP ( pch_lpghvt ) W W -TOLERANCE 0
    lvs_check_property                      MP ( pch_lvt ) L L -TOLERANCE 0
    lvs_check_property                      MP ( pch_lvt ) W W -TOLERANCE 0
    lvs_check_property                      MP ( pch_mlvt ) L L -TOLERANCE 0
    lvs_check_property                      MP ( pch_mlvt ) W W -TOLERANCE 0
    lvs_check_property                      MP ( pch_timer ) L L -TOLERANCE 0
    lvs_check_property                      MP ( pch_timer ) W W -TOLERANCE 0
    lvs_check_property                      MP ( pch_uhvt ) L L -TOLERANCE 0
    lvs_check_property                      MP ( pch_uhvt ) W W -TOLERANCE 0
    lvs_check_property                      MP ( pch_ulvt ) L L -TOLERANCE 0
    lvs_check_property                      MP ( pch_ulvt ) W W -TOLERANCE 0
    lvs_check_property                      MP ( pch_w ) L L -TOLERANCE 0
    lvs_check_property                      MP ( pch_w ) W W -TOLERANCE 0
    lvs_check_property                      MP ( pch_w_lvt ) L L -TOLERANCE 0
    lvs_check_property                      MP ( pch_w_lvt ) W W -TOLERANCE 0
    lvs_check_property                      MP ( pchpu_dphcsr ) L L -TOLERANCE 0
    lvs_check_property                      MP ( pchpu_dphcsr ) W W -TOLERANCE 0
    lvs_check_property                      MP ( pchpu_dpsr ) L L -TOLERANCE 0
    lvs_check_property                      MP ( pchpu_dpsr ) W W -TOLERANCE 0
    lvs_check_property                      MP ( pchpu_hvtdphcsr ) L L -TOLERANCE 0
    lvs_check_property                      MP ( pchpu_hvtdphcsr ) W W -TOLERANCE 0
    lvs_check_property                      MP ( pchpu_hvtdpsr ) L L -TOLERANCE 0
    lvs_check_property                      MP ( pchpu_hvtdpsr ) W W -TOLERANCE 0
    lvs_check_property                      MP ( pchpu_hvtsr ) L L -TOLERANCE 0
    lvs_check_property                      MP ( pchpu_hvtsr ) W W -TOLERANCE 0
    lvs_check_property                      MP ( pchpu_lpgdpsr ) L L -TOLERANCE 0
    lvs_check_property                      MP ( pchpu_lpgdpsr ) W W -TOLERANCE 0
    lvs_check_property                      MP ( pchpu_lpgsr ) L L -TOLERANCE 0
    lvs_check_property                      MP ( pchpu_lpgsr ) W W -TOLERANCE 0
    lvs_check_property                      MP ( pchpu_lpgtpsr ) L L -TOLERANCE 0
    lvs_check_property                      MP ( pchpu_lpgtpsr ) W W -TOLERANCE 0
    lvs_check_property                      MP ( pchpu_sr ) L L -TOLERANCE 0
    lvs_check_property                      MP ( pchpu_sr ) W W -TOLERANCE 0
    lvs_check_property                      MP ( pchpu_ulpdpsr ) L L -TOLERANCE 0
    lvs_check_property                      MP ( pchpu_ulpdpsr ) W W -TOLERANCE 0
    lvs_check_property                      MP ( pchpu_ulpsr ) L L -TOLERANCE 0
    lvs_check_property                      MP ( pchpu_ulpsr ) W W -TOLERANCE 0
    lvs_check_property                      MP ( pchpu_wisr ) L L -TOLERANCE 0
    lvs_check_property                      MP ( pchpu_wisr ) W W -TOLERANCE 0
    lvs_check_property                      MP ( pchpu_wosr ) L L -TOLERANCE 0
    lvs_check_property                      MP ( pchpu_wosr ) W W -TOLERANCE 0
    lvs_check_property                      Q ( npn10 ) A A -TOLERANCE 0
    lvs_check_property                      Q ( npn10_s ) A A -TOLERANCE 0
    lvs_check_property                      Q ( npn2 ) A A -TOLERANCE 0
    lvs_check_property                      Q ( npn2_s ) A A -TOLERANCE 0
    lvs_check_property                      Q ( npn5 ) A A -TOLERANCE 0
    lvs_check_property                      Q ( npn5_s ) A A -TOLERANCE 0
    lvs_check_property                      Q ( pnp10 ) A A -TOLERANCE 0
    lvs_check_property                      Q ( pnp10_s ) A A -TOLERANCE 0
    lvs_check_property                      Q ( pnp2 ) A A -TOLERANCE 0
    lvs_check_property                      Q ( pnp2_s ) A A -TOLERANCE 0
    lvs_check_property                      Q ( pnp5 ) A A -TOLERANCE 0
    lvs_check_property                      Q ( pnp5_s ) A A -TOLERANCE 0
    lvs_check_property                      D ( ndio ) A A -TOLERANCE 0
    lvs_check_property                      D ( ndio_18 ) A A -TOLERANCE 0
    lvs_check_property                      D ( ndio_25 ) A A -TOLERANCE 0
    lvs_check_property                      D ( ndio_25od ) A A -TOLERANCE 0
    lvs_check_property                      D ( ndio_25od28 ) A A -TOLERANCE 0
    lvs_check_property                      D ( ndio_25ud ) A A -TOLERANCE 0
    lvs_check_property                      D ( ndio_33 ) A A -TOLERANCE 0
    lvs_check_property                      D ( ndio_cehv ) A A -TOLERANCE 0
    lvs_check_property                      D ( ndio_esd ) A A -TOLERANCE 0
    lvs_check_property                      D ( ndio_hvt ) A A -TOLERANCE 0
    lvs_check_property                      D ( ndio_lpg ) A A -TOLERANCE 0
    lvs_check_property                      D ( ndio_lpghvt ) A A -TOLERANCE 0
    lvs_check_property                      D ( ndio_lpgna ) A A -TOLERANCE 0
    lvs_check_property                      D ( ndio_lvt ) A A -TOLERANCE 0
    lvs_check_property                      D ( ndio_mlvt ) A A -TOLERANCE 0
    lvs_check_property                      D ( ndio_na ) A A -TOLERANCE 0
    lvs_check_property                      D ( ndio_na18 ) A A -TOLERANCE 0
    lvs_check_property                      D ( ndio_na25 ) A A -TOLERANCE 0
    lvs_check_property                      D ( ndio_na25od ) A A -TOLERANCE 0
    lvs_check_property                      D ( ndio_na25ud ) A A -TOLERANCE 0
    lvs_check_property                      D ( ndio_na33 ) A A -TOLERANCE 0
    lvs_check_property                      D ( ndio_uhvt ) A A -TOLERANCE 0
    lvs_check_property                      D ( ndio_w ) A A -TOLERANCE 0
    lvs_check_property                      D ( nwdio ) A A -TOLERANCE 0
    lvs_check_property                      D ( pdio ) A A -TOLERANCE 0
    lvs_check_property                      D ( pdio_18 ) A A -TOLERANCE 0
    lvs_check_property                      D ( pdio_25 ) A A -TOLERANCE 0
    lvs_check_property                      D ( pdio_25od ) A A -TOLERANCE 0
    lvs_check_property                      D ( pdio_25od28 ) A A -TOLERANCE 0
    lvs_check_property                      D ( pdio_25ud ) A A -TOLERANCE 0
    lvs_check_property                      D ( pdio_33 ) A A -TOLERANCE 0
    lvs_check_property                      D ( pdio_cehv ) A A -TOLERANCE 0
    lvs_check_property                      D ( pdio_hvt ) A A -TOLERANCE 0
    lvs_check_property                      D ( pdio_lpg ) A A -TOLERANCE 0
    lvs_check_property                      D ( pdio_lpghvt ) A A -TOLERANCE 0
    lvs_check_property                      D ( pdio_lvt ) A A -TOLERANCE 0
    lvs_check_property                      D ( pdio_mlvt ) A A -TOLERANCE 0
    lvs_check_property                      D ( pdio_uhvt ) A A -TOLERANCE 0
    lvs_check_property                      D ( pdio_w ) A A -TOLERANCE 0
    lvs_check_property                      D ( zdio_cehv ) A A -TOLERANCE 0
    lvs_check_property                      crtmom_rf nv nv -TOLERANCE 0
    lvs_check_property                      crtmom_rf nh nh -TOLERANCE 0
    lvs_check_property                      crtmom_rf s s -TOLERANCE 0
    lvs_check_property                      crtmom_rf w w -TOLERANCE 0
    lvs_check_property                      crtmom_rf stm stm -TOLERANCE 0
    lvs_check_property                      crtmom_rf spm spm -TOLERANCE 0
    lvs_check_property                      crtmom_rf_rdk nv nv -TOLERANCE 0
    lvs_check_property                      crtmom_rf_rdk nh nh -TOLERANCE 0
    lvs_check_property                      crtmom_rf_rdk s s -TOLERANCE 0
    lvs_check_property                      crtmom_rf_rdk w w -TOLERANCE 0
    lvs_check_property                      crtmom_rf_rdk stm stm -TOLERANCE 0
    lvs_check_property                      crtmom_rf_rdk spm spm -TOLERANCE 0
    lvs_check_property                      crtmom nv nv -TOLERANCE 0
    lvs_check_property                      crtmom nh nh -TOLERANCE 0
    lvs_check_property                      crtmom s s -TOLERANCE 0
    lvs_check_property                      crtmom w w -TOLERANCE 0
    lvs_check_property                      crtmom stm stm -TOLERANCE 0
    lvs_check_property                      crtmom spm spm -TOLERANCE 0
    lvs_check_property                      crtmom_2t nv nv -TOLERANCE 0
    lvs_check_property                      crtmom_2t nh nh -TOLERANCE 0
    lvs_check_property                      crtmom_2t s s -TOLERANCE 0
    lvs_check_property                      crtmom_2t w w -TOLERANCE 0
    lvs_check_property                      crtmom_2t stm stm -TOLERANCE 0
    lvs_check_property                      crtmom_2t spm spm -TOLERANCE 0
    lvs_check_property                      crtmom_mx nv nv -TOLERANCE 0
    lvs_check_property                      crtmom_mx nh nh -TOLERANCE 0
    lvs_check_property                      crtmom_mx s s -TOLERANCE 0
    lvs_check_property                      crtmom_mx w w -TOLERANCE 0
    lvs_check_property                      crtmom_mx stm stm -TOLERANCE 0
    lvs_check_property                      crtmom_mx spm spm -TOLERANCE 0
    lvs_check_property                      crtmom_mx mf mf -TOLERANCE 0
    lvs_check_property                      fmom nr nr -TOLERANCE 0
    lvs_check_property                      fmom lr lr -TOLERANCE 0
    lvs_check_property                      fmom s s -TOLERANCE 0
    lvs_check_property                      fmom w w -TOLERANCE 0
    lvs_check_property                      fmom stm stm -TOLERANCE 0
    lvs_check_property                      fmom spm spm -TOLERANCE 0
    lvs_check_property                      fmom_mx nr nr -TOLERANCE 0
    lvs_check_property                      fmom_mx lr lr -TOLERANCE 0
    lvs_check_property                      fmom_mx s s -TOLERANCE 0
    lvs_check_property                      fmom_mx w w -TOLERANCE 0
    lvs_check_property                      fmom_mx stm stm -TOLERANCE 0
    lvs_check_property                      fmom_mx spm spm -TOLERANCE 0
    lvs_check_property                      fmom_mx mf mf -TOLERANCE 0
    lvs_check_property                      lincap wr wr -TOLERANCE 0
    lvs_check_property                      lincap lr lr -TOLERANCE 0
    lvs_check_property                      lincap mr mr -TOLERANCE 0
    lvs_check_property                      lincap_25 wr wr -TOLERANCE 0
    lvs_check_property                      lincap_25 lr lr -TOLERANCE 0
    lvs_check_property                      lincap_25 mr mr -TOLERANCE 0
    lvs_check_property                      lincap_rf lr lr -TOLERANCE 0
    lvs_check_property                      lincap_rf wr wr -TOLERANCE 0
    lvs_check_property                      lincap_rf br br -TOLERANCE 0
    lvs_check_property                      lincap_rf gr gr -TOLERANCE 0
    lvs_check_property                      lincap_rf_25 lr lr -TOLERANCE 0
    lvs_check_property                      lincap_rf_25 wr wr -TOLERANCE 0
    lvs_check_property                      lincap_rf_25 br br -TOLERANCE 0
    lvs_check_property                      lincap_rf_25 gr gr -TOLERANCE 0
    lvs_check_property                      lowcpad_d15 lt lt -TOLERANCE 0
    lvs_check_property                      lowcpad_d15 wt wt -TOLERANCE 0
    lvs_check_property                      lowcpad_d15 lay lay -TOLERANCE 0
    lvs_check_property                      lowcpad_d23 lt lt -TOLERANCE 0
    lvs_check_property                      lowcpad_d23 wt wt -TOLERANCE 0
    lvs_check_property                      lowcpad_d23 lay lay -TOLERANCE 0
    lvs_check_property                      mimcap_sin lt lt -TOLERANCE 0
    lvs_check_property                      mimcap_sin wt wt -TOLERANCE 0
    lvs_check_property                      mimcap_sin mimflag mimflag -TOLERANCE 0
    lvs_check_property                      mimcap_sin_3t lt lt -TOLERANCE 0
    lvs_check_property                      mimcap_sin_3t wt wt -TOLERANCE 0
    lvs_check_property                      mimcap_sin_3t lay lay -TOLERANCE 0
    lvs_check_property                      mimcap_sin_3t mimflag mimflag -TOLERANCE 0
    lvs_check_property                      mimcap_um_sin_rf wt wt -TOLERANCE 0
    lvs_check_property                      mimcap_um_sin_rf lt lt -TOLERANCE 0
    lvs_check_property                      mimcap_um_sin_rf mimflag mimflag -TOLERANCE 0
    lvs_check_property                      mimcap_woum_sin_rf wt wt -TOLERANCE 0
    lvs_check_property                      mimcap_woum_sin_rf lt lt -TOLERANCE 0
    lvs_check_property                      mimcap_woum_sin_rf mimflag mimflag -TOLERANCE 0
    lvs_check_property                      mimcap_woum_sin_rf lay lay -TOLERANCE 0
    lvs_check_property                      moscap_rf lr lr -TOLERANCE 0
    lvs_check_property                      moscap_rf wr wr -TOLERANCE 0
    lvs_check_property                      moscap_rf br br -TOLERANCE 0
    lvs_check_property                      moscap_rf gr gr -TOLERANCE 0
    lvs_check_property                      moscap_rf18 lr lr -TOLERANCE 0
    lvs_check_property                      moscap_rf18 wr wr -TOLERANCE 0
    lvs_check_property                      moscap_rf18 br br -TOLERANCE 0
    lvs_check_property                      moscap_rf18 gr gr -TOLERANCE 0
    lvs_check_property                      moscap_rf18_nw lr lr -TOLERANCE 0
    lvs_check_property                      moscap_rf18_nw wr wr -TOLERANCE 0
    lvs_check_property                      moscap_rf18_nw br br -TOLERANCE 0
    lvs_check_property                      moscap_rf18_nw gr gr -TOLERANCE 0
    lvs_check_property                      moscap_rf25 lr lr -TOLERANCE 0
    lvs_check_property                      moscap_rf25 wr wr -TOLERANCE 0
    lvs_check_property                      moscap_rf25 br br -TOLERANCE 0
    lvs_check_property                      moscap_rf25 gr gr -TOLERANCE 0
    lvs_check_property                      moscap_rf25_nw lr lr -TOLERANCE 0
    lvs_check_property                      moscap_rf25_nw wr wr -TOLERANCE 0
    lvs_check_property                      moscap_rf25_nw br br -TOLERANCE 0
    lvs_check_property                      moscap_rf25_nw gr gr -TOLERANCE 0
    lvs_check_property                      moscap_rf33 lr lr -TOLERANCE 0
    lvs_check_property                      moscap_rf33 wr wr -TOLERANCE 0
    lvs_check_property                      moscap_rf33 br br -TOLERANCE 0
    lvs_check_property                      moscap_rf33 gr gr -TOLERANCE 0
    lvs_check_property                      moscap_rf33_nw lr lr -TOLERANCE 0
    lvs_check_property                      moscap_rf33_nw wr wr -TOLERANCE 0
    lvs_check_property                      moscap_rf33_nw br br -TOLERANCE 0
    lvs_check_property                      moscap_rf33_nw gr gr -TOLERANCE 0
    lvs_check_property                      moscap_rf_hvt lr lr -TOLERANCE 0
    lvs_check_property                      moscap_rf_hvt wr wr -TOLERANCE 0
    lvs_check_property                      moscap_rf_hvt br br -TOLERANCE 0
    lvs_check_property                      moscap_rf_hvt gr gr -TOLERANCE 0
    lvs_check_property                      moscap_rf_hvt_nw lr lr -TOLERANCE 0
    lvs_check_property                      moscap_rf_hvt_nw wr wr -TOLERANCE 0
    lvs_check_property                      moscap_rf_hvt_nw br br -TOLERANCE 0
    lvs_check_property                      moscap_rf_hvt_nw gr gr -TOLERANCE 0
    lvs_check_property                      moscap_rf_nw lr lr -TOLERANCE 0
    lvs_check_property                      moscap_rf_nw wr wr -TOLERANCE 0
    lvs_check_property                      moscap_rf_nw br br -TOLERANCE 0
    lvs_check_property                      moscap_rf_nw gr gr -TOLERANCE 0
    lvs_check_property                      moscap_rf_rdk lr lr -TOLERANCE 0
    lvs_check_property                      moscap_rf_rdk wr wr -TOLERANCE 0
    lvs_check_property                      moscap_rf_rdk br br -TOLERANCE 0
    lvs_check_property                      moscap_rf_rdk gr gr -TOLERANCE 0
    lvs_check_property                      ndio_hia_rf aw aw -TOLERANCE 0
    lvs_check_property                      ndio_hia_rf al al -TOLERANCE 0
    lvs_check_property                      nmos_rf wr wr -TOLERANCE 0
    lvs_check_property                      nmos_rf lr lr -TOLERANCE 0
    lvs_check_property                      nmos_rf nr nr -TOLERANCE 0
    lvs_check_property                      nmos_rf_18 wr wr -TOLERANCE 0
    lvs_check_property                      nmos_rf_18 lr lr -TOLERANCE 0
    lvs_check_property                      nmos_rf_18 nr nr -TOLERANCE 0
    lvs_check_property                      nmos_rf_18_6t wr wr -TOLERANCE 0
    lvs_check_property                      nmos_rf_18_6t lr lr -TOLERANCE 0
    lvs_check_property                      nmos_rf_18_6t nr nr -TOLERANCE 0
    lvs_check_property                      nmos_rf_18_nodnw wr wr -TOLERANCE 0
    lvs_check_property                      nmos_rf_18_nodnw lr lr -TOLERANCE 0
    lvs_check_property                      nmos_rf_18_nodnw nr nr -TOLERANCE 0
    lvs_check_property                      nmos_rf_25 wr wr -TOLERANCE 0
    lvs_check_property                      nmos_rf_25 lr lr -TOLERANCE 0
    lvs_check_property                      nmos_rf_25 nr nr -TOLERANCE 0
    lvs_check_property                      nmos_rf_25_6t wr wr -TOLERANCE 0
    lvs_check_property                      nmos_rf_25_6t lr lr -TOLERANCE 0
    lvs_check_property                      nmos_rf_25_6t nr nr -TOLERANCE 0
    lvs_check_property                      nmos_rf_25_nodnw wr wr -TOLERANCE 0
    lvs_check_property                      nmos_rf_25_nodnw lr lr -TOLERANCE 0
    lvs_check_property                      nmos_rf_25_nodnw nr nr -TOLERANCE 0
    lvs_check_property                      nmos_rf_25_nodnwod wr wr -TOLERANCE 0
    lvs_check_property                      nmos_rf_25_nodnwod lr lr -TOLERANCE 0
    lvs_check_property                      nmos_rf_25_nodnwod nr nr -TOLERANCE 0
    lvs_check_property                      nmos_rf_25_nodnwud wr wr -TOLERANCE 0
    lvs_check_property                      nmos_rf_25_nodnwud lr lr -TOLERANCE 0
    lvs_check_property                      nmos_rf_25_nodnwud nr nr -TOLERANCE 0
    lvs_check_property                      nmos_rf_25od wr wr -TOLERANCE 0
    lvs_check_property                      nmos_rf_25od lr lr -TOLERANCE 0
    lvs_check_property                      nmos_rf_25od nr nr -TOLERANCE 0
    lvs_check_property                      nmos_rf_25od33_6t wr wr -TOLERANCE 0
    lvs_check_property                      nmos_rf_25od33_6t lr lr -TOLERANCE 0
    lvs_check_property                      nmos_rf_25od33_6t nr nr -TOLERANCE 0
    lvs_check_property                      nmos_rf_25ud wr wr -TOLERANCE 0
    lvs_check_property                      nmos_rf_25ud lr lr -TOLERANCE 0
    lvs_check_property                      nmos_rf_25ud nr nr -TOLERANCE 0
    lvs_check_property                      nmos_rf_25ud18_6t wr wr -TOLERANCE 0
    lvs_check_property                      nmos_rf_25ud18_6t lr lr -TOLERANCE 0
    lvs_check_property                      nmos_rf_25ud18_6t nr nr -TOLERANCE 0
    lvs_check_property                      nmos_rf_33 wr wr -TOLERANCE 0
    lvs_check_property                      nmos_rf_33 lr lr -TOLERANCE 0
    lvs_check_property                      nmos_rf_33 nr nr -TOLERANCE 0
    lvs_check_property                      nmos_rf_33_6t wr wr -TOLERANCE 0
    lvs_check_property                      nmos_rf_33_6t lr lr -TOLERANCE 0
    lvs_check_property                      nmos_rf_33_6t nr nr -TOLERANCE 0
    lvs_check_property                      nmos_rf_33_nodnw wr wr -TOLERANCE 0
    lvs_check_property                      nmos_rf_33_nodnw lr lr -TOLERANCE 0
    lvs_check_property                      nmos_rf_33_nodnw nr nr -TOLERANCE 0
    lvs_check_property                      nmos_rf_6t wr wr -TOLERANCE 0
    lvs_check_property                      nmos_rf_6t lr lr -TOLERANCE 0
    lvs_check_property                      nmos_rf_6t nr nr -TOLERANCE 0
    lvs_check_property                      nmos_rf_cas_nw wr wr -tolerance 0
    lvs_check_property                      nmos_rf_cas_nw lr lr -tolerance 0
    lvs_check_property                      nmos_rf_cas_nw nr nr -tolerance 0
    lvs_check_property                      nmos_rf_cas_nw lrr lrr -tolerance 0
    lvs_check_property                      nmos_rf_cas_nw wrr wrr -tolerance 0
    lvs_check_property                      nmos_rf_cas_nw nrr nrr -tolerance 0
    lvs_check_property                      nmos_rf_cross_nw wr wr -tolerance 0
    lvs_check_property                      nmos_rf_cross_nw lr lr -tolerance 0
    lvs_check_property                      nmos_rf_cross_nw nr nr -tolerance 0
    lvs_check_property                      nmos_rf_diff_nw wr wr -tolerance 0
    lvs_check_property                      nmos_rf_diff_nw lr lr -tolerance 0
    lvs_check_property                      nmos_rf_diff_nw nr nr -tolerance 0
    lvs_check_property                      nmos_rf_hvt wr wr -TOLERANCE 0
    lvs_check_property                      nmos_rf_hvt lr lr -TOLERANCE 0
    lvs_check_property                      nmos_rf_hvt nr nr -TOLERANCE 0
    lvs_check_property                      nmos_rf_hvt_6t wr wr -TOLERANCE 0
    lvs_check_property                      nmos_rf_hvt_6t lr lr -TOLERANCE 0
    lvs_check_property                      nmos_rf_hvt_6t nr nr -TOLERANCE 0
    lvs_check_property                      nmos_rf_hvt_nodnw wr wr -TOLERANCE 0
    lvs_check_property                      nmos_rf_hvt_nodnw lr lr -TOLERANCE 0
    lvs_check_property                      nmos_rf_hvt_nodnw nr nr -TOLERANCE 0
    lvs_check_property                      nmos_rf_lvt wr wr -TOLERANCE 0
    lvs_check_property                      nmos_rf_lvt lr lr -TOLERANCE 0
    lvs_check_property                      nmos_rf_lvt nr nr -TOLERANCE 0
    lvs_check_property                      nmos_rf_lvt_6t wr wr -TOLERANCE 0
    lvs_check_property                      nmos_rf_lvt_6t lr lr -TOLERANCE 0
    lvs_check_property                      nmos_rf_lvt_6t nr nr -TOLERANCE 0
    lvs_check_property                      nmos_rf_lvt_nodnw wr wr -TOLERANCE 0
    lvs_check_property                      nmos_rf_lvt_nodnw lr lr -TOLERANCE 0
    lvs_check_property                      nmos_rf_lvt_nodnw nr nr -TOLERANCE 0
    lvs_check_property                      nmos_rf_mlvt wr wr -TOLERANCE 0
    lvs_check_property                      nmos_rf_mlvt lr lr -TOLERANCE 0
    lvs_check_property                      nmos_rf_mlvt nr nr -TOLERANCE 0
    lvs_check_property                      nmos_rf_mlvt_6t wr wr -TOLERANCE 0
    lvs_check_property                      nmos_rf_mlvt_6t lr lr -TOLERANCE 0
    lvs_check_property                      nmos_rf_mlvt_6t nr nr -TOLERANCE 0
    lvs_check_property                      nmos_rf_mlvt_nodnw wr wr -TOLERANCE 0
    lvs_check_property                      nmos_rf_mlvt_nodnw lr lr -TOLERANCE 0
    lvs_check_property                      nmos_rf_mlvt_nodnw nr nr -TOLERANCE 0
    lvs_check_property                      nmos_rf_na18 wr wr -TOLERANCE 0
    lvs_check_property                      nmos_rf_na18 lr lr -TOLERANCE 0
    lvs_check_property                      nmos_rf_na18 nr nr -TOLERANCE 0
    lvs_check_property                      nmos_rf_nodnw wr wr -TOLERANCE 0
    lvs_check_property                      nmos_rf_nodnw lr lr -TOLERANCE 0
    lvs_check_property                      nmos_rf_nodnw nr nr -TOLERANCE 0
    lvs_check_property                      nmos_rf_rdk wr wr -TOLERANCE 0
    lvs_check_property                      nmos_rf_rdk lr lr -TOLERANCE 0
    lvs_check_property                      nmos_rf_rdk nr nr -TOLERANCE 0
    lvs_check_property                      nmoscap lr lr -TOLERANCE 0
    lvs_check_property                      nmoscap wr wr -TOLERANCE 0
    lvs_check_property                      nmoscap_18 lr lr -TOLERANCE 0
    lvs_check_property                      nmoscap_18 wr wr -TOLERANCE 0
    lvs_check_property                      nmoscap_25 lr lr -TOLERANCE 0
    lvs_check_property                      nmoscap_25 wr wr -TOLERANCE 0
    lvs_check_property                      nmoscap_33 lr lr -TOLERANCE 0
    lvs_check_property                      nmoscap_33 wr wr -TOLERANCE 0
    lvs_check_property                      nmoscap_lpg lr lr -TOLERANCE 0
    lvs_check_property                      nmoscap_lpg wr wr -TOLERANCE 0
    lvs_check_property                      pdio_hia_rf aw aw -TOLERANCE 0
    lvs_check_property                      pdio_hia_rf al al -TOLERANCE 0
    lvs_check_property                      pmos_rf wr wr -TOLERANCE 0
    lvs_check_property                      pmos_rf lr lr -TOLERANCE 0
    lvs_check_property                      pmos_rf nr nr -TOLERANCE 0
    lvs_check_property                      pmos_rf_18 wr wr -TOLERANCE 0
    lvs_check_property                      pmos_rf_18 lr lr -TOLERANCE 0
    lvs_check_property                      pmos_rf_18 nr nr -TOLERANCE 0
    lvs_check_property                      pmos_rf_18_5t wr wr -TOLERANCE 0
    lvs_check_property                      pmos_rf_18_5t lr lr -TOLERANCE 0
    lvs_check_property                      pmos_rf_18_5t nr nr -TOLERANCE 0
    lvs_check_property                      pmos_rf_18_nw wr wr -TOLERANCE 0
    lvs_check_property                      pmos_rf_18_nw lr lr -TOLERANCE 0
    lvs_check_property                      pmos_rf_18_nw nr nr -TOLERANCE 0
    lvs_check_property                      pmos_rf_18_nw_5t wr wr -TOLERANCE 0
    lvs_check_property                      pmos_rf_18_nw_5t lr lr -TOLERANCE 0
    lvs_check_property                      pmos_rf_18_nw_5t nr nr -TOLERANCE 0
    lvs_check_property                      pmos_rf_25 wr wr -TOLERANCE 0
    lvs_check_property                      pmos_rf_25 lr lr -TOLERANCE 0
    lvs_check_property                      pmos_rf_25 nr nr -TOLERANCE 0
    lvs_check_property                      pmos_rf_25_5t wr wr -TOLERANCE 0
    lvs_check_property                      pmos_rf_25_5t lr lr -TOLERANCE 0
    lvs_check_property                      pmos_rf_25_5t nr nr -TOLERANCE 0
    lvs_check_property                      pmos_rf_25_nw wr wr -TOLERANCE 0
    lvs_check_property                      pmos_rf_25_nw lr lr -TOLERANCE 0
    lvs_check_property                      pmos_rf_25_nw nr nr -TOLERANCE 0
    lvs_check_property                      pmos_rf_25_nw_5t wr wr -TOLERANCE 0
    lvs_check_property                      pmos_rf_25_nw_5t lr lr -TOLERANCE 0
    lvs_check_property                      pmos_rf_25_nw_5t nr nr -TOLERANCE 0
    lvs_check_property                      pmos_rf_25_nwod wr wr -TOLERANCE 0
    lvs_check_property                      pmos_rf_25_nwod lr lr -TOLERANCE 0
    lvs_check_property                      pmos_rf_25_nwod nr nr -TOLERANCE 0
    lvs_check_property                      pmos_rf_25_nwud wr wr -TOLERANCE 0
    lvs_check_property                      pmos_rf_25_nwud lr lr -TOLERANCE 0
    lvs_check_property                      pmos_rf_25_nwud nr nr -TOLERANCE 0
    lvs_check_property                      pmos_rf_25od wr wr -TOLERANCE 0
    lvs_check_property                      pmos_rf_25od lr lr -TOLERANCE 0
    lvs_check_property                      pmos_rf_25od nr nr -TOLERANCE 0
    lvs_check_property                      pmos_rf_25od33_5t wr wr -TOLERANCE 0
    lvs_check_property                      pmos_rf_25od33_5t lr lr -TOLERANCE 0
    lvs_check_property                      pmos_rf_25od33_5t nr nr -TOLERANCE 0
    lvs_check_property                      pmos_rf_25od33_nw_5t wr wr -TOLERANCE 0
    lvs_check_property                      pmos_rf_25od33_nw_5t lr lr -TOLERANCE 0
    lvs_check_property                      pmos_rf_25od33_nw_5t nr nr -TOLERANCE 0
    lvs_check_property                      pmos_rf_25ud wr wr -TOLERANCE 0
    lvs_check_property                      pmos_rf_25ud lr lr -TOLERANCE 0
    lvs_check_property                      pmos_rf_25ud nr nr -TOLERANCE 0
    lvs_check_property                      pmos_rf_25ud18_5t wr wr -TOLERANCE 0
    lvs_check_property                      pmos_rf_25ud18_5t lr lr -TOLERANCE 0
    lvs_check_property                      pmos_rf_25ud18_5t nr nr -TOLERANCE 0
    lvs_check_property                      pmos_rf_25ud18_nw_5t wr wr -TOLERANCE 0
    lvs_check_property                      pmos_rf_25ud18_nw_5t lr lr -TOLERANCE 0
    lvs_check_property                      pmos_rf_25ud18_nw_5t nr nr -TOLERANCE 0
    lvs_check_property                      pmos_rf_33 wr wr -TOLERANCE 0
    lvs_check_property                      pmos_rf_33 lr lr -TOLERANCE 0
    lvs_check_property                      pmos_rf_33 nr nr -TOLERANCE 0
    lvs_check_property                      pmos_rf_33_5t wr wr -TOLERANCE 0
    lvs_check_property                      pmos_rf_33_5t lr lr -TOLERANCE 0
    lvs_check_property                      pmos_rf_33_5t nr nr -TOLERANCE 0
    lvs_check_property                      pmos_rf_33_nw wr wr -TOLERANCE 0
    lvs_check_property                      pmos_rf_33_nw lr lr -TOLERANCE 0
    lvs_check_property                      pmos_rf_33_nw nr nr -TOLERANCE 0
    lvs_check_property                      pmos_rf_33_nw_5t wr wr -TOLERANCE 0
    lvs_check_property                      pmos_rf_33_nw_5t lr lr -TOLERANCE 0
    lvs_check_property                      pmos_rf_33_nw_5t nr nr -TOLERANCE 0
    lvs_check_property                      pmos_rf_5t wr wr -TOLERANCE 0
    lvs_check_property                      pmos_rf_5t lr lr -TOLERANCE 0
    lvs_check_property                      pmos_rf_5t nr nr -TOLERANCE 0
    lvs_check_property                      pmos_rf_hvt wr wr -TOLERANCE 0
    lvs_check_property                      pmos_rf_hvt lr lr -TOLERANCE 0
    lvs_check_property                      pmos_rf_hvt nr nr -TOLERANCE 0
    lvs_check_property                      pmos_rf_hvt_5t wr wr -TOLERANCE 0
    lvs_check_property                      pmos_rf_hvt_5t lr lr -TOLERANCE 0
    lvs_check_property                      pmos_rf_hvt_5t nr nr -TOLERANCE 0
    lvs_check_property                      pmos_rf_hvt_nw wr wr -TOLERANCE 0
    lvs_check_property                      pmos_rf_hvt_nw lr lr -TOLERANCE 0
    lvs_check_property                      pmos_rf_hvt_nw nr nr -TOLERANCE 0
    lvs_check_property                      pmos_rf_hvt_nw_5t wr wr -TOLERANCE 0
    lvs_check_property                      pmos_rf_hvt_nw_5t lr lr -TOLERANCE 0
    lvs_check_property                      pmos_rf_hvt_nw_5t nr nr -TOLERANCE 0
    lvs_check_property                      pmos_rf_lvt wr wr -TOLERANCE 0
    lvs_check_property                      pmos_rf_lvt lr lr -TOLERANCE 0
    lvs_check_property                      pmos_rf_lvt nr nr -TOLERANCE 0
    lvs_check_property                      pmos_rf_lvt_5t wr wr -TOLERANCE 0
    lvs_check_property                      pmos_rf_lvt_5t lr lr -TOLERANCE 0
    lvs_check_property                      pmos_rf_lvt_5t nr nr -TOLERANCE 0
    lvs_check_property                      pmos_rf_lvt_nw wr wr -TOLERANCE 0
    lvs_check_property                      pmos_rf_lvt_nw lr lr -TOLERANCE 0
    lvs_check_property                      pmos_rf_lvt_nw nr nr -TOLERANCE 0
    lvs_check_property                      pmos_rf_lvt_nw_5t wr wr -TOLERANCE 0
    lvs_check_property                      pmos_rf_lvt_nw_5t lr lr -TOLERANCE 0
    lvs_check_property                      pmos_rf_lvt_nw_5t nr nr -TOLERANCE 0
    lvs_check_property                      pmos_rf_mlvt wr wr -TOLERANCE 0
    lvs_check_property                      pmos_rf_mlvt lr lr -TOLERANCE 0
    lvs_check_property                      pmos_rf_mlvt nr nr -TOLERANCE 0
    lvs_check_property                      pmos_rf_mlvt_5t wr wr -TOLERANCE 0
    lvs_check_property                      pmos_rf_mlvt_5t lr lr -TOLERANCE 0
    lvs_check_property                      pmos_rf_mlvt_5t nr nr -TOLERANCE 0
    lvs_check_property                      pmos_rf_mlvt_nw wr wr -TOLERANCE 0
    lvs_check_property                      pmos_rf_mlvt_nw lr lr -TOLERANCE 0
    lvs_check_property                      pmos_rf_mlvt_nw nr nr -TOLERANCE 0
    lvs_check_property                      pmos_rf_mlvt_nw_5t wr wr -TOLERANCE 0
    lvs_check_property                      pmos_rf_mlvt_nw_5t lr lr -TOLERANCE 0
    lvs_check_property                      pmos_rf_mlvt_nw_5t nr nr -TOLERANCE 0
    lvs_check_property                      pmos_rf_nw wr wr -TOLERANCE 0
    lvs_check_property                      pmos_rf_nw lr lr -TOLERANCE 0
    lvs_check_property                      pmos_rf_nw nr nr -TOLERANCE 0
    lvs_check_property                      pmos_rf_nw_5t wr wr -TOLERANCE 0
    lvs_check_property                      pmos_rf_nw_5t lr lr -TOLERANCE 0
    lvs_check_property                      pmos_rf_nw_5t nr nr -TOLERANCE 0
    lvs_check_property                      pmos_rf_rdk wr wr -TOLERANCE 0
    lvs_check_property                      pmos_rf_rdk lr lr -TOLERANCE 0
    lvs_check_property                      pmos_rf_rdk nr nr -TOLERANCE 0
    lvs_check_property                      pmoscap_rf lr lr -TOLERANCE 0
    lvs_check_property                      pmoscap_rf wr wr -TOLERANCE 0
    lvs_check_property                      pmoscap_rf br br -TOLERANCE 0
    lvs_check_property                      pmoscap_rf gr gr -TOLERANCE 0
    lvs_check_property                      pmoscap_rf18 lr lr -TOLERANCE 0
    lvs_check_property                      pmoscap_rf18 wr wr -TOLERANCE 0
    lvs_check_property                      pmoscap_rf18 br br -TOLERANCE 0
    lvs_check_property                      pmoscap_rf18 gr gr -TOLERANCE 0
    lvs_check_property                      pmoscap_rf25 lr lr -TOLERANCE 0
    lvs_check_property                      pmoscap_rf25 wr wr -TOLERANCE 0
    lvs_check_property                      pmoscap_rf25 br br -TOLERANCE 0
    lvs_check_property                      pmoscap_rf25 gr gr -TOLERANCE 0
    lvs_check_property                      probe1 a a -TOLERANCE 0
    lvs_check_property                      probe1 pj pj -TOLERANCE 0
    lvs_check_property                      probe2 a a -TOLERANCE 0
    lvs_check_property                      probe2 pj pj -TOLERANCE 0
    lvs_check_property                      probe3 a a -TOLERANCE 0
    lvs_check_property                      probe3 pj pj -TOLERANCE 0
    lvs_check_property                      probe4 a a -TOLERANCE 0
    lvs_check_property                      probe4 pj pj -TOLERANCE 0
    lvs_check_property                      probe5 a a -TOLERANCE 0
    lvs_check_property                      probe5 pj pj -TOLERANCE 0
    lvs_check_property                      probe6 a a -TOLERANCE 0
    lvs_check_property                      probe6 pj pj -TOLERANCE 0
    lvs_check_property                      probe7 a a -TOLERANCE 0
    lvs_check_property                      probe7 pj pj -TOLERANCE 0
    lvs_check_property                      rfesd_rf1 lay lay -tolerance 0
    lvs_check_property                      rfesd_rf2 lay lay -tolerance 0
    lvs_check_property                      rfesd_rf3 lay lay -tolerance 0
    lvs_check_property                      rfesd_rf4 lay lay -tolerance 0
    lvs_check_property                      rfesd_rf5 lay lay -tolerance 0
    lvs_check_property                      rfesd_rf6 lay lay -tolerance 0
    lvs_check_property                      rfesd_rf7 lay lay -tolerance 0
    lvs_check_property                      rfesd_rf8 lay lay -tolerance 0
    lvs_check_property                      rm1 w w -TOLERANCE 0
    lvs_check_property                      rm1 l l -TOLERANCE 0
    lvs_check_property                      rm10 w w -TOLERANCE 0
    lvs_check_property                      rm10 l l -TOLERANCE 0
    lvs_check_property                      rm2 w w -TOLERANCE 0
    lvs_check_property                      rm2 l l -TOLERANCE 0
    lvs_check_property                      rm3 w w -TOLERANCE 0
    lvs_check_property                      rm3 l l -TOLERANCE 0
    lvs_check_property                      rm4 w w -TOLERANCE 0
    lvs_check_property                      rm4 l l -TOLERANCE 0
    lvs_check_property                      rm5 w w -TOLERANCE 0
    lvs_check_property                      rm5 l l -TOLERANCE 0
    lvs_check_property                      rm6 w w -TOLERANCE 0
    lvs_check_property                      rm6 l l -TOLERANCE 0
    lvs_check_property                      rm7 w w -TOLERANCE 0
    lvs_check_property                      rm7 l l -TOLERANCE 0
    lvs_check_property                      rm8 w w -TOLERANCE 0
    lvs_check_property                      rm8 l l -TOLERANCE 0
    lvs_check_property                      rm9 w w -TOLERANCE 0
    lvs_check_property                      rm9 l l -TOLERANCE 0
    lvs_check_property                      rnodl l l -TOLERANCE 0
    lvs_check_property                      rnodl w w -TOLERANCE 0
    lvs_check_property                      rnodl_m lr lr -TOLERANCE 0
    lvs_check_property                      rnodl_m wr wr -TOLERANCE 0
    lvs_check_property                      rnods l l -TOLERANCE 0
    lvs_check_property                      rnods w w -TOLERANCE 0
    lvs_check_property                      rnods_m lr lr -TOLERANCE 0
    lvs_check_property                      rnods_m wr wr -TOLERANCE 0
    lvs_check_property                      rnodwo l l -TOLERANCE 0
    lvs_check_property                      rnodwo w w -TOLERANCE 0
    lvs_check_property                      rnodwo_m lr lr -TOLERANCE 0
    lvs_check_property                      rnodwo_m wr wr -TOLERANCE 0
    lvs_check_property                      rnpolyl l l -TOLERANCE 0
    lvs_check_property                      rnpolyl w w -TOLERANCE 0
    lvs_check_property                      rnpolyl_m lr lr -TOLERANCE 0
    lvs_check_property                      rnpolyl_m wr wr -TOLERANCE 0
    lvs_check_property                      rnpolys l l -TOLERANCE 0
    lvs_check_property                      rnpolys w w -TOLERANCE 0
    lvs_check_property                      rnpolys_m lr lr -TOLERANCE 0
    lvs_check_property                      rnpolys_m wr wr -TOLERANCE 0
    lvs_check_property                      rnpolywo l l -TOLERANCE 0
    lvs_check_property                      rnpolywo w w -TOLERANCE 0
    lvs_check_property                      rnpolywo_m lr lr -TOLERANCE 0
    lvs_check_property                      rnpolywo_m wr wr -TOLERANCE 0
    lvs_check_property                      rnwod l l -TOLERANCE 0
    lvs_check_property                      rnwod w w -TOLERANCE 0
    lvs_check_property                      rnwod_m lr lr -TOLERANCE 0
    lvs_check_property                      rnwod_m wr wr -TOLERANCE 0
    lvs_check_property                      rnwsti l l -TOLERANCE 0
    lvs_check_property                      rnwsti w w -TOLERANCE 0
    lvs_check_property                      rnwsti_m lr lr -TOLERANCE 0
    lvs_check_property                      rnwsti_m wr wr -TOLERANCE 0
    lvs_check_property                      rpodl l l -TOLERANCE 0
    lvs_check_property                      rpodl w w -TOLERANCE 0
    lvs_check_property                      rpodl_m lr lr -TOLERANCE 0
    lvs_check_property                      rpodl_m wr wr -TOLERANCE 0
    lvs_check_property                      rpods l l -TOLERANCE 0
    lvs_check_property                      rpods w w -TOLERANCE 0
    lvs_check_property                      rpods_m lr lr -TOLERANCE 0
    lvs_check_property                      rpods_m wr wr -TOLERANCE 0
    lvs_check_property                      rpodwo l l -TOLERANCE 0
    lvs_check_property                      rpodwo w w -TOLERANCE 0
    lvs_check_property                      rpodwo_m lr lr -TOLERANCE 0
    lvs_check_property                      rpodwo_m wr wr -TOLERANCE 0
    lvs_check_property                      rppolyl l l -TOLERANCE 0
    lvs_check_property                      rppolyl w w -TOLERANCE 0
    lvs_check_property                      rppolyl_m lr lr -TOLERANCE 0
    lvs_check_property                      rppolyl_m wr wr -TOLERANCE 0
    lvs_check_property                      rppolyl_rf w w -TOLERANCE 0
    lvs_check_property                      rppolyl_rf l l -TOLERANCE 0
    lvs_check_property                      rppolyl_rf_rdk w w -TOLERANCE 0
    lvs_check_property                      rppolyl_rf_rdk l l -TOLERANCE 0
    lvs_check_property                      rppolys l l -TOLERANCE 0
    lvs_check_property                      rppolys w w -TOLERANCE 0
    lvs_check_property                      rppolys_m lr lr -TOLERANCE 0
    lvs_check_property                      rppolys_m wr wr -TOLERANCE 0
    lvs_check_property                      rppolys_rf w w -TOLERANCE 0
    lvs_check_property                      rppolys_rf l l -TOLERANCE 0
    lvs_check_property                      rppolys_rf_rdk w w -TOLERANCE 0
    lvs_check_property                      rppolys_rf_rdk l l -TOLERANCE 0
    lvs_check_property                      rppolywo l l -TOLERANCE 0
    lvs_check_property                      rppolywo w w -TOLERANCE 0
    lvs_check_property                      rppolywo_m lr lr -TOLERANCE 0
    lvs_check_property                      rppolywo_m wr wr -TOLERANCE 0
    lvs_check_property                      rppolywo_rf w w -TOLERANCE 0
    lvs_check_property                      rppolywo_rf l l -TOLERANCE 0
    lvs_check_property                      rppolywo_rf_rdk w w -TOLERANCE 0
    lvs_check_property                      rppolywo_rf_rdk l l -TOLERANCE 0
    lvs_check_property                      sbd_rf w w -TOLERANCE 0
    lvs_check_property                      sbd_rf l l -TOLERANCE 0
    lvs_check_property                      sbd_rf nf nf -TOLERANCE 0
    lvs_check_property                      sbd_rf_nw w w -TOLERANCE 0
    lvs_check_property                      sbd_rf_nw l l -TOLERANCE 0
    lvs_check_property                      sbd_rf_nw nf nf -TOLERANCE 0
    lvs_check_property                      sline_gscpw_mu l l -tolerance 0
    lvs_check_property                      sline_gscpw_mu w w -tolerance 0
    lvs_check_property                      sline_gscpw_mu s s -tolerance 0
    lvs_check_property                      sline_gscpw_mu lay lay -tolerance 0
    lvs_check_property                      sline_ms_mu l l -tolerance 0
    lvs_check_property                      sline_ms_mu w w -tolerance 0
    lvs_check_property                      sline_ms_mu lay lay -tolerance 0
    lvs_check_property                      spiral_std_mu_z lay lay -TOLERANCE 0
    lvs_check_property                      spiral_std_mu_z w w -TOLERANCE 0
    lvs_check_property                      spiral_std_mu_z spacing spacing -TOLERANCE 0
    lvs_check_property                      spiral_std_mu_z nr nr -TOLERANCE 0
    lvs_check_property                      spiral_std_mu_z rad rad -TOLERANCE 0
    lvs_check_property                      spiral_std_mu_z gdis gdis -TOLERANCE 0
    lvs_check_property                      spiral_std_mu_z_rdk lay lay -TOLERANCE 0
    lvs_check_property                      spiral_std_mu_z_rdk w w -TOLERANCE 0
    lvs_check_property                      spiral_std_mu_z_rdk spacing spacing -TOLERANCE 0
    lvs_check_property                      spiral_std_mu_z_rdk nr nr -TOLERANCE 0
    lvs_check_property                      spiral_std_mu_z_rdk rad rad -TOLERANCE 0
    lvs_check_property                      spiral_std_mu_z_rdk gdis gdis -TOLERANCE 0
    lvs_check_property                      spiral_sym_ct_mu_z lay lay -TOLERANCE 0
    lvs_check_property                      spiral_sym_ct_mu_z w w -TOLERANCE 0
    lvs_check_property                      spiral_sym_ct_mu_z spacing spacing -TOLERANCE 0
    lvs_check_property                      spiral_sym_ct_mu_z nr nr -TOLERANCE 0
    lvs_check_property                      spiral_sym_ct_mu_z rad rad -TOLERANCE 0
    lvs_check_property                      spiral_sym_ct_mu_z gdis gdis -TOLERANCE 0
    lvs_check_property                      spiral_sym_ct_mu_z_rdk lay lay -TOLERANCE 0
    lvs_check_property                      spiral_sym_ct_mu_z_rdk w w -TOLERANCE 0
    lvs_check_property                      spiral_sym_ct_mu_z_rdk spacing spacing -TOLERANCE 0
    lvs_check_property                      spiral_sym_ct_mu_z_rdk nr nr -TOLERANCE 0
    lvs_check_property                      spiral_sym_ct_mu_z_rdk rad rad -TOLERANCE 0
    lvs_check_property                      spiral_sym_ct_mu_z_rdk gdis gdis -TOLERANCE 0
    lvs_check_property                      spiral_sym_mu_z lay lay -TOLERANCE 0
    lvs_check_property                      spiral_sym_mu_z w w -TOLERANCE 0
    lvs_check_property                      spiral_sym_mu_z spacing spacing -TOLERANCE 0
    lvs_check_property                      spiral_sym_mu_z nr nr -TOLERANCE 0
    lvs_check_property                      spiral_sym_mu_z rad rad -TOLERANCE 0
    lvs_check_property                      spiral_sym_mu_z gdis gdis -TOLERANCE 0
    lvs_check_property                      spiral_sym_mu_z_rdk lay lay -TOLERANCE 0
    lvs_check_property                      spiral_sym_mu_z_rdk w w -TOLERANCE 0
    lvs_check_property                      spiral_sym_mu_z_rdk spacing spacing -TOLERANCE 0
    lvs_check_property                      spiral_sym_mu_z_rdk nr nr -TOLERANCE 0
    lvs_check_property                      spiral_sym_mu_z_rdk rad rad -TOLERANCE 0
    lvs_check_property                      spiral_sym_mu_z_rdk gdis gdis -TOLERANCE 0
    lvs_check_property                      xjvar w w -TOLERANCE 0
    lvs_check_property                      xjvar l l -TOLERANCE 0
    lvs_check_property                      xjvar nr nr -TOLERANCE 0
    lvs_check_property                      xjvar_nw w w -TOLERANCE 0
    lvs_check_property                      xjvar_nw l l -TOLERANCE 0
    lvs_check_property                      xjvar_nw nr nr -TOLERANCE 0
    lvs_report_file                         lvs.rep
    lvs_report_max                          1000 -mismatched_net_limit 100 
    lvs_report_opt                          S
    unit                                    -length u
    input_scale                             1000
    virtual_connect                         yes -colon
    virtual_connect                         yes -semicolon_as_colon
    virtual_connect                         no  -report
    virtual_connect                         -depth primary
    text_depth                              -primary
    text_depth                              -PRIMARY
    port                                    -depth -PRIMARY

Default LVS Rule Values
-----------------------

    lvs_abort                               -softchk no
    lvs_abort                               -check_device_for_property_rule no
    lvs_abort                               -missing_hcell no
    lvs_abort                               -erc_error yes
    lvs_abort                               -inconsistent_reduction yes
    layout_case_sensitive                   no
    // layout_cpf_file                       
    // schematic_cpf_file                    
    schematic_case_sensitive                no
    // hcell_file                            
    // hcell                                 
    // lvs_exclude_hcell                     
    lvs_push_devices                        yes
    lvs_push_devices_properties             no
    lvs_netlist                             yes -substrate_comment
    lvs_netlist                             yes -box_contents
    lvs_netlist                             yes -unnamed_box_pins
    lvs_netlist                             no -allow_inconsistent_model
    lvs_netlist                             yes -properties_comment
    // lvs_write_netlist                     
    // lvs_write_netlist_reduced             
    // lvs_delete_cell_pin                   
    // lvs_black_box                         
    // lvs_interposer                        
    lvs_spice                               yes -allow_floating_pins
    lvs_spice                               yes -allow_duplicate_subcircuit_names
    lvs_spice                               no  -conditional_ldd
    lvs_spice                               no  -override_globals
    lvs_spice                               no  -redefine_param
    lvs_spice                               no  -replicate_devices
    lvs_spice                               no  -replicate_devices_enhanced
    lvs_spice                               yes -slash_is_space
    lvs_spice                               yes -keep_back_slash
    lvs_spice                               no  -allow_unquoted_strings
    lvs_spice                               no  -allow_inline_parameters
    lvs_spice                               no  -calculate_mos_area
    lvs_spice                               no  -strict_wl
    lvs_spice                               no  -cull_primitive_subcircuits
    lvs_spice                               no  -ignore_option_scale
    lvs_spice                               no  -show_neg_param_warning
    lvs_spice                               no  -scale_x_parameters
    lvs_spice                               yes -strict_subckts_order
    // lvs_spice_option                      
    lvs_reverse_wl                          no
    // lvs_spice_multiplier_name             
                                             
    lvs_compare_case                        no
    lvs_cname                               no  -cell
    lvs_cname                               yes -pin
    lvs_cname                               yes -net
    lvs_cname                               no  -instance
    lvs_non_user_name                       -port "^[0-9]+$"
    lvs_non_user_name                       -net  "^[0-9]+$"
    // lvs_non_user_name                    -instance 
    lvs_out_of_range_exclude_zero           no
    // lvs_group_models                      
    lvs_strict_subtypes                     no
    lvs_exact_subtypes                      no
    lvs_preserve_box_ports                  no
    // lvs_cpoint                            
    // lvs_cell_list                         
    lvs_auto_pin_swap                       yes -swap_threshold 4000000
    lvs_swap_non_cpoint_pins                yes
    // lvs_swap_pins                         
    lvs_builtin_device_pin_swap             yes
    // lvs_join_nets                         
    lvs_global_sigs_are_ports               yes
    lvs_discard_pins                        no
    lvs_filter                              no  -bipolar
    lvs_filter                              no  -capacitors
    lvs_filter                              no  -diodes
    lvs_filter                              no  -mos
    lvs_filter                              no  -resistors
    // lvs_filter_device                     
    // lvs_filter_device_keep_net            
    lvs_reduction_priority                  -parallel
    lvs_derive_logic                        yes -sram
    lvs_derive_logic                        no  -dram
    lvs_derive_logic                        no  -rom
    // lvs_recognize_gates_tolerance         
    lvs_reduce                              no  -series_diodes
    lvs_reduce                              no  -series_mos
    // lvs_reduce_do_not_merge               
    lvs_expand_on_device_climbing           no
    lvs_expand_unbalanced_cells             yes
    // lvs_check_all_properties_by_name      
    // lvs_property_map                      
    // lvs_transfer_property                 
    lvs_warn_max                            50
    lvs_inconsistent_reduction_threshold    1000000
    lvs_report_units                        yes
    lvs_keep_data                           no
    lvs_keep_source_cells                   no
    lvs_create_match_db                     no
    // lvs_map_device                        
    unit                                    -resistance ohm
    unit                                    -capacitance pf
    lvs_verilog_bus_map_by_position         no
    lvs_verilog_keep_backslash              no
    lvs_verilog_detect_buses                no
    lvs_do_not_normalize                    no
    // lvs_generic_device                    
    virtual_connect                         no  -colon
    virtual_connect                         yes -semicolon_as_colon
    // virtual_connect                      -name 
    virtual_connect                         no -report
    virtual_connect                         no -incremental
    lvs_preserve_parameterized_cells        no
    lvs_check_color                         no
    // lvs_schematic_color_path              
    // lvs_assign_conflict_layer             
    // lvs_conflict_layer_check             
    lvs_check_color_label                   no
    // lvs_preserve_cells                    

Effective LVS Rule Values
-------------------------

    lvs_swap_non_cpoint_pins                yes -unbound_pin_threshold 10000
    layout_primary                          counter
    lvs_cname                               no   -pin
    // lvs_non_user_name                    -port 
    lvs_filter_option                       AG RC RE RG -source
    lvs_filter_option                       AG RC RE RG -layout
    lvs_derive_logic                        no   -sram
    lvs_recognize_gates                     -none
    virtual_connect                         yes -colon
    virtual_connect                         no  -report
    text_depth                              -primary


##############################################################################################################
#
#                                               CELL COMPARISON                                               
#
##############################################################################################################

                              +------------------------------------------------+
                              |                                                |
                              |        ------->>>   MATCH   <<<-------         |
                              |                                                |
                              |             counter  <vs>  counter             |
                              |                                                |
                              |                                                |
                              +------------------------------------------------+

+===[counter]=================================================================================================
|                                                 STATISTICS                                                  
+=============================================================================================================


                |     Original      |     Filtered      |     Reduced      
Cell            |   lay   :   sch   |   lay   :   sch   |   lay   :  sch
----------------+---------+---------+---------+---------+---------+--------
MP [4 pins]     |         :         |         :         |         :        
 MP(PCH)        |     106 :     106 |     106 :     106 |      90 :      90
MN [4 pins]     |         :         |         :         |         :        
 MN(NCH)        |     106 :     106 |     106 :     106 |      90 :      90
----------------+---------+---------+---------+---------+---------+--------
Total           |     212 :     212 |     212 :     212 |     180 :     180
================+=========+=========+=========+=========+=========+========
Pins            |         :         |         :         |      *6 :       8
Nets            |         :         |         :         |     *88 :      86
================+=========+=========+=========+=========+=========+========

+===[counter]=================================================================================================
|                                      DEVICES REMOVED DURING REDUCTION                                       
+=============================================================================================================


                |     Parallel      |      Series       |     Deleted Nets     
Cell            |   lay   :   sch   |   lay   :   sch   |    lay    :   sch
----------------+---------+---------+---------+---------+-----------+----------
MP [4 pins]     |         :         |         :         |           :          
 MP(PCH)        |      16 :      16 |       - :       - |         0 :         0
MN [4 pins]     |         :         |         :         |           :          
 MN(NCH)        |      16 :      16 |       - :       - |         0 :         0
----------------+---------+---------+---------+---------+-----------+----------

+===[counter]=================================================================================================
|                                           INITIAL CORRESPONDENCES                                           
+=============================================================================================================

Type     | Name
---------+--------------------------------------------------
Net      | clk count[0] count[1] count[2] count[3] reset


##############################################################################################################
#
#                                                END OF REPORT                                                
#
##############################################################################################################

