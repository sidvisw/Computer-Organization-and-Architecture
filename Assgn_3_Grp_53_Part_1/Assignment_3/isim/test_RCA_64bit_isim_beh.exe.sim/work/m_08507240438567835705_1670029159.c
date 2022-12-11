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
static const char *ng0 = "A = %d B = %d S = %d";
static const char *ng1 = "/home/umang/Assignment_3/test_RCA_64bit.v";
static int ng2[] = {0, 0, 0, 0};
static int ng3[] = {0, 0};
static int ng4[] = {56, 0, 0, 0};
static int ng5[] = {57, 0, 0, 0};
static unsigned int ng6[] = {1569325056U, 0U, 23283064U, 0U};
static unsigned int ng7[] = {2353987584U, 0U, 34924596U, 0U};
static unsigned int ng8[] = {4294967295U, 0U, 2147483647U, 0U};

void Monitor_55_1(char *);
void Monitor_55_1(char *);


static void Monitor_55_1_Func(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    t1 = (t0 + 1608);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t0 + 1768);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t0 + 1048U);
    t8 = *((char **)t7);
    xsi_vlogfile_write(1, 0, 3, ng0, 4, t0, (char)118, t3, 64, (char)118, t6, 64, (char)118, t8, 64);

LAB1:    return;
}

static void Initial_45_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;

LAB0:    t1 = (t0 + 2840U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(45, ng1);

LAB4:    xsi_set_current_line(47, ng1);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 64);
    xsi_set_current_line(48, ng1);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 64);
    xsi_set_current_line(49, ng1);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(52, ng1);
    t2 = (t0 + 2648);
    xsi_process_wait(t2, 100000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(55, ng1);
    Monitor_55_1(t0);
    xsi_set_current_line(58, ng1);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 64);
    xsi_set_current_line(59, ng1);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 64);
    xsi_set_current_line(60, ng1);
    t2 = (t0 + 2648);
    xsi_process_wait(t2, 16000LL);
    *((char **)t1) = &&LAB6;
    goto LAB1;

LAB6:    xsi_set_current_line(62, ng1);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 64);
    xsi_set_current_line(63, ng1);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 64);
    xsi_set_current_line(64, ng1);
    t2 = (t0 + 2648);
    xsi_process_wait(t2, 16000LL);
    *((char **)t1) = &&LAB7;
    goto LAB1;

LAB7:    xsi_set_current_line(66, ng1);
    t2 = ((char*)((ng8)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 64);
    xsi_set_current_line(67, ng1);
    t2 = ((char*)((ng8)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 64);
    xsi_set_current_line(68, ng1);
    t2 = (t0 + 2648);
    xsi_process_wait(t2, 16000LL);
    *((char **)t1) = &&LAB8;
    goto LAB1;

LAB8:    xsi_set_current_line(70, ng1);
    xsi_vlog_finish(1);
    goto LAB1;

}

void Monitor_55_1(char *t0)
{
    char *t1;
    char *t2;

LAB0:    t1 = (t0 + 2896);
    t2 = (t0 + 3408);
    xsi_vlogfile_monitor((void *)Monitor_55_1_Func, t1, t2);

LAB1:    return;
}


extern void work_m_08507240438567835705_1670029159_init()
{
	static char *pe[] = {(void *)Initial_45_0,(void *)Monitor_55_1};
	xsi_register_didat("work_m_08507240438567835705_1670029159", "isim/test_RCA_64bit_isim_beh.exe.sim/work/m_08507240438567835705_1670029159.didat");
	xsi_register_executes(pe);
}
