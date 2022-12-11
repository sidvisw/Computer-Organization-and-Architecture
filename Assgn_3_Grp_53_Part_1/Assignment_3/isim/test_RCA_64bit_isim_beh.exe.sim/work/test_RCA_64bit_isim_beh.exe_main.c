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
    work_m_14564960912260282664_0209709607_init();
    work_m_05532940680782456522_2648124674_init();
    work_m_09592747990732652183_1414961706_init();
    work_m_12104502721294965841_2914171332_init();
    work_m_04513612579924143503_1477475827_init();
    work_m_14497698059573581387_3046878559_init();
    work_m_08507240438567835705_1670029159_init();
    work_m_16541823861846354283_2073120511_init();


    xsi_register_tops("work_m_08507240438567835705_1670029159");
    xsi_register_tops("work_m_16541823861846354283_2073120511");


    return xsi_run_simulation(argc, argv);

}
