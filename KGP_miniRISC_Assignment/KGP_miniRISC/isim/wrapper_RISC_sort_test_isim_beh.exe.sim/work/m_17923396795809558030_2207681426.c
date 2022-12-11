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

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/sidharth/Desktop/COA/KGP_miniRISC_Assignment/KGP_miniRISC/shifter.v";



static void Always_28_0(char *t0)
{
    char t11[8];
    char t28[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    char *t27;

LAB0:    t1 = (t0 + 2840U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(28, ng0);
    t2 = (t0 + 3160);
    *((int *)t2) = 1;
    t3 = (t0 + 2872);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(28, ng0);

LAB5:    xsi_set_current_line(29, ng0);
    t4 = (t0 + 1528U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(37, ng0);

LAB19:    xsi_set_current_line(38, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    memset(t11, 0, 8);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB23;

LAB21:    if (*((unsigned int *)t2) == 0)
        goto LAB20;

LAB22:    t4 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t4) = 1;

LAB23:    t5 = (t11 + 4);
    t14 = *((unsigned int *)t5);
    t15 = (~(t14));
    t16 = *((unsigned int *)t11);
    t17 = (t16 & t15);
    t18 = (t17 != 0);
    if (t18 > 0)
        goto LAB24;

LAB25:    xsi_set_current_line(41, ng0);

LAB28:    xsi_set_current_line(42, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = (t0 + 1208U);
    t4 = *((char **)t2);
    memset(t11, 0, 8);
    xsi_vlog_signed_rshift(t11, 32, t3, 32, t4, 5);
    t2 = (t0 + 1928);
    xsi_vlogvar_assign_value(t2, t11, 0, 0, 32);

LAB26:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(29, ng0);

LAB9:    xsi_set_current_line(30, ng0);
    t12 = (t0 + 1368U);
    t13 = *((char **)t12);
    memset(t11, 0, 8);
    t12 = (t13 + 4);
    t14 = *((unsigned int *)t12);
    t15 = (~(t14));
    t16 = *((unsigned int *)t13);
    t17 = (t16 & t15);
    t18 = (t17 & 1U);
    if (t18 != 0)
        goto LAB13;

LAB11:    if (*((unsigned int *)t12) == 0)
        goto LAB10;

LAB12:    t19 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t19) = 1;

LAB13:    t20 = (t11 + 4);
    t21 = *((unsigned int *)t20);
    t22 = (~(t21));
    t23 = *((unsigned int *)t11);
    t24 = (t23 & t22);
    t25 = (t24 != 0);
    if (t25 > 0)
        goto LAB14;

LAB15:    xsi_set_current_line(33, ng0);

LAB18:    xsi_set_current_line(34, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = (t0 + 1208U);
    t4 = *((char **)t2);
    memset(t11, 0, 8);
    xsi_vlog_signed_arith_rshift(t11, 32, t3, 32, t4, 5);
    t2 = (t0 + 1928);
    xsi_vlogvar_assign_value(t2, t11, 0, 0, 32);

LAB16:    goto LAB8;

LAB10:    *((unsigned int *)t11) = 1;
    goto LAB13;

LAB14:    xsi_set_current_line(30, ng0);

LAB17:    xsi_set_current_line(31, ng0);
    t26 = (t0 + 1048U);
    t27 = *((char **)t26);
    t26 = (t0 + 1928);
    xsi_vlogvar_assign_value(t26, t27, 0, 0, 32);
    goto LAB16;

LAB20:    *((unsigned int *)t11) = 1;
    goto LAB23;

LAB24:    xsi_set_current_line(38, ng0);

LAB27:    xsi_set_current_line(39, ng0);
    t12 = (t0 + 1048U);
    t13 = *((char **)t12);
    t12 = (t0 + 1208U);
    t19 = *((char **)t12);
    memset(t28, 0, 8);
    xsi_vlog_signed_lshift(t28, 32, t13, 32, t19, 5);
    t12 = (t0 + 1928);
    xsi_vlogvar_assign_value(t12, t28, 0, 0, 32);
    goto LAB26;

}


extern void work_m_17923396795809558030_2207681426_init()
{
	static char *pe[] = {(void *)Always_28_0};
	xsi_register_didat("work_m_17923396795809558030_2207681426", "isim/wrapper_RISC_sort_test_isim_beh.exe.sim/work/m_17923396795809558030_2207681426.didat");
	xsi_register_executes(pe);
}
