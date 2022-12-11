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
    work_m_01442323080767557492_3381898454_init();
    xilinxcorelib_ver_m_04284627112054182733_0097192460_init();
    xilinxcorelib_ver_m_18166792875774041790_2843080771_init();
    xilinxcorelib_ver_m_17738287534884592592_4060787071_init();
    xilinxcorelib_ver_m_10066368518302646626_1353721065_init();
    work_m_05240187959938530918_0765933608_init();
    work_m_09967154365136236377_0412501146_init();
    work_m_03603663952639803657_0278921292_init();
    work_m_16825878251971121632_1351276808_init();
    work_m_03954277672849229161_1947578403_init();
    work_m_04292228980245641599_3415651129_init();
    work_m_01855393885240526119_3207788825_init();
    work_m_14054234174832048397_1582716182_init();
    work_m_02397981805291222381_3591303662_init();
    work_m_18043201142145620046_3408909850_init();
    work_m_05074099001321534648_0833183191_init();
    work_m_17923396795809558030_2207681426_init();
    work_m_13087300670111431221_0200372766_init();
    work_m_12668456191102925762_3948285920_init();
    work_m_16569948981419207378_0886308060_init();
    work_m_10208022041535194561_1637954243_init();
    work_m_09079006534451446495_3960456194_init();
    xilinxcorelib_ver_m_04284627112054182733_3123221743_init();
    xilinxcorelib_ver_m_17738287534884592592_4163442614_init();
    xilinxcorelib_ver_m_10066368518302646626_1965101482_init();
    work_m_10431123694831851113_1783167462_init();
    work_m_09967154365136236377_3203437358_init();
    work_m_00292212423068457457_4017027212_init();
    work_m_09433775492263355055_3563785098_init();
    work_m_02895413881221134877_3210600050_init();
    work_m_16541823861846354283_2073120511_init();


    xsi_register_tops("work_m_02895413881221134877_3210600050");
    xsi_register_tops("work_m_16541823861846354283_2073120511");


    return xsi_run_simulation(argc, argv);

}