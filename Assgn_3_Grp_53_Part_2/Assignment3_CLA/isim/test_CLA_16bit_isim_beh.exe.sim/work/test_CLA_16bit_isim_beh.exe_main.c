/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_14054234174832048397_1582716182_init();
    work_m_02397981805291222381_3591303662_init();
    work_m_18043201142145620046_3408909850_init();
    work_m_11055795837573747895_0509962776_init();
    work_m_00171377504709871561_0423153506_init();
    work_m_16541823861846354283_2073120511_init();


    xsi_register_tops("work_m_00171377504709871561_0423153506");
    xsi_register_tops("work_m_16541823861846354283_2073120511");


    return xsi_run_simulation(argc, argv);

}
