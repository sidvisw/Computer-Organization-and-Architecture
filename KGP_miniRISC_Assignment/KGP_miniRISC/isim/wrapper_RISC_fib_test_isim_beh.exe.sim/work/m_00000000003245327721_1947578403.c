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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Student/Desktop/KGP_miniRisc_Assignment/KGP_miniRISC/ALU_control.v";
static int ng1[] = {5, 0};
static int ng2[] = {1, 0};
static unsigned int ng3[] = {0U, 0U};
static unsigned int ng4[] = {8U, 0U};
static unsigned int ng5[] = {1U, 0U};
static unsigned int ng6[] = {9U, 0U};
static unsigned int ng7[] = {5U, 0U};



static void Always_26_0(char *t0)
{
    char t6[8];
    char t11[8];
    char t41[8];
    char t46[8];
    char t60[8];
    char t68[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    char *t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    char *t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    char *t59;
    char *t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    char *t67;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    char *t72;
    char *t73;
    char *t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    char *t82;
    char *t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    int t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    char *t96;
    unsigned int t97;
    unsigned int t98;
    unsigned int t99;
    unsigned int t100;
    unsigned int t101;
    char *t102;
    char *t103;

LAB0:    t1 = (t0 + 2528U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(26, ng0);
    t2 = (t0 + 2848);
    *((int *)t2) = 1;
    t3 = (t0 + 2560);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(26, ng0);

LAB5:    xsi_set_current_line(27, ng0);
    t4 = (t0 + 1048U);
    t5 = *((char **)t4);
    t4 = (t0 + 1008U);
    t7 = (t4 + 72U);
    t8 = *((char **)t7);
    t9 = ((char*)((ng1)));
    xsi_vlog_generic_get_index_select_value(t6, 32, t5, t8, 2, t9, 32, 1);
    t10 = ((char*)((ng2)));
    memset(t11, 0, 8);
    t12 = (t6 + 4);
    t13 = (t10 + 4);
    t14 = *((unsigned int *)t6);
    t15 = *((unsigned int *)t10);
    t16 = (t14 ^ t15);
    t17 = *((unsigned int *)t12);
    t18 = *((unsigned int *)t13);
    t19 = (t17 ^ t18);
    t20 = (t16 | t19);
    t21 = *((unsigned int *)t12);
    t22 = *((unsigned int *)t13);
    t23 = (t21 | t22);
    t24 = (~(t23));
    t25 = (t20 & t24);
    if (t25 != 0)
        goto LAB9;

LAB6:    if (t23 != 0)
        goto LAB8;

LAB7:    *((unsigned int *)t11) = 1;

LAB9:    t27 = (t11 + 4);
    t28 = *((unsigned int *)t27);
    t29 = (~(t28));
    t30 = *((unsigned int *)t11);
    t31 = (t30 & t29);
    t32 = (t31 != 0);
    if (t32 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(29, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng3)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t14 = *((unsigned int *)t3);
    t15 = *((unsigned int *)t2);
    t16 = (t14 ^ t15);
    t17 = *((unsigned int *)t4);
    t18 = *((unsigned int *)t5);
    t19 = (t17 ^ t18);
    t20 = (t16 | t19);
    t21 = *((unsigned int *)t4);
    t22 = *((unsigned int *)t5);
    t23 = (t21 | t22);
    t24 = (~(t23));
    t25 = (t20 & t24);
    if (t25 != 0)
        goto LAB16;

LAB13:    if (t23 != 0)
        goto LAB15;

LAB14:    *((unsigned int *)t6) = 1;

LAB16:    t8 = (t6 + 4);
    t28 = *((unsigned int *)t8);
    t29 = (~(t28));
    t30 = *((unsigned int *)t6);
    t31 = (t30 & t29);
    t32 = (t31 != 0);
    if (t32 > 0)
        goto LAB17;

LAB18:    xsi_set_current_line(31, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t14 = *((unsigned int *)t3);
    t15 = *((unsigned int *)t2);
    t16 = (t14 ^ t15);
    t17 = *((unsigned int *)t4);
    t18 = *((unsigned int *)t5);
    t19 = (t17 ^ t18);
    t20 = (t16 | t19);
    t21 = *((unsigned int *)t4);
    t22 = *((unsigned int *)t5);
    t23 = (t21 | t22);
    t24 = (~(t23));
    t25 = (t20 & t24);
    if (t25 != 0)
        goto LAB23;

LAB20:    if (t23 != 0)
        goto LAB22;

LAB21:    *((unsigned int *)t6) = 1;

LAB23:    memset(t11, 0, 8);
    t8 = (t6 + 4);
    t28 = *((unsigned int *)t8);
    t29 = (~(t28));
    t30 = *((unsigned int *)t6);
    t31 = (t30 & t29);
    t32 = (t31 & 1U);
    if (t32 != 0)
        goto LAB24;

LAB25:    if (*((unsigned int *)t8) != 0)
        goto LAB26;

LAB27:    t10 = (t11 + 4);
    t35 = *((unsigned int *)t11);
    t36 = (!(t35));
    t37 = *((unsigned int *)t10);
    t38 = (t36 || t37);
    if (t38 > 0)
        goto LAB28;

LAB29:    memcpy(t68, t11, 8);

LAB30:    t96 = (t68 + 4);
    t97 = *((unsigned int *)t96);
    t98 = (~(t97));
    t99 = *((unsigned int *)t68);
    t100 = (t99 & t98);
    t101 = (t100 != 0);
    if (t101 > 0)
        goto LAB42;

LAB43:    xsi_set_current_line(33, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng6)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t14 = *((unsigned int *)t3);
    t15 = *((unsigned int *)t2);
    t16 = (t14 ^ t15);
    t17 = *((unsigned int *)t4);
    t18 = *((unsigned int *)t5);
    t19 = (t17 ^ t18);
    t20 = (t16 | t19);
    t21 = *((unsigned int *)t4);
    t22 = *((unsigned int *)t5);
    t23 = (t21 | t22);
    t24 = (~(t23));
    t25 = (t20 & t24);
    if (t25 != 0)
        goto LAB48;

LAB45:    if (t23 != 0)
        goto LAB47;

LAB46:    *((unsigned int *)t6) = 1;

LAB48:    t8 = (t6 + 4);
    t28 = *((unsigned int *)t8);
    t29 = (~(t28));
    t30 = *((unsigned int *)t6);
    t31 = (t30 & t29);
    t32 = (t31 != 0);
    if (t32 > 0)
        goto LAB49;

LAB50:    xsi_set_current_line(36, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);

LAB51:
LAB44:
LAB19:
LAB12:    goto LAB2;

LAB8:    t26 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(28, ng0);
    t33 = ((char*)((ng3)));
    t34 = (t0 + 1608);
    xsi_vlogvar_assign_value(t34, t33, 0, 0, 4);
    goto LAB12;

LAB15:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB16;

LAB17:    xsi_set_current_line(30, ng0);
    t9 = (t0 + 1208U);
    t10 = *((char **)t9);
    memset(t11, 0, 8);
    t9 = (t11 + 4);
    t12 = (t10 + 4);
    t35 = *((unsigned int *)t10);
    t36 = (t35 >> 0);
    *((unsigned int *)t11) = t36;
    t37 = *((unsigned int *)t12);
    t38 = (t37 >> 0);
    *((unsigned int *)t9) = t38;
    t39 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t39 & 15U);
    t40 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t40 & 15U);
    t13 = (t0 + 1608);
    xsi_vlogvar_assign_value(t13, t11, 0, 0, 4);
    goto LAB19;

LAB22:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB23;

LAB24:    *((unsigned int *)t11) = 1;
    goto LAB27;

LAB26:    t9 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t9) = 1;
    goto LAB27;

LAB28:    t12 = (t0 + 1048U);
    t13 = *((char **)t12);
    memset(t41, 0, 8);
    t12 = (t41 + 4);
    t26 = (t13 + 4);
    t39 = *((unsigned int *)t13);
    t40 = (t39 >> 4);
    *((unsigned int *)t41) = t40;
    t42 = *((unsigned int *)t26);
    t43 = (t42 >> 4);
    *((unsigned int *)t12) = t43;
    t44 = *((unsigned int *)t41);
    *((unsigned int *)t41) = (t44 & 3U);
    t45 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t45 & 3U);
    t27 = ((char*)((ng5)));
    memset(t46, 0, 8);
    t33 = (t41 + 4);
    t34 = (t27 + 4);
    t47 = *((unsigned int *)t41);
    t48 = *((unsigned int *)t27);
    t49 = (t47 ^ t48);
    t50 = *((unsigned int *)t33);
    t51 = *((unsigned int *)t34);
    t52 = (t50 ^ t51);
    t53 = (t49 | t52);
    t54 = *((unsigned int *)t33);
    t55 = *((unsigned int *)t34);
    t56 = (t54 | t55);
    t57 = (~(t56));
    t58 = (t53 & t57);
    if (t58 != 0)
        goto LAB34;

LAB31:    if (t56 != 0)
        goto LAB33;

LAB32:    *((unsigned int *)t46) = 1;

LAB34:    memset(t60, 0, 8);
    t61 = (t46 + 4);
    t62 = *((unsigned int *)t61);
    t63 = (~(t62));
    t64 = *((unsigned int *)t46);
    t65 = (t64 & t63);
    t66 = (t65 & 1U);
    if (t66 != 0)
        goto LAB35;

LAB36:    if (*((unsigned int *)t61) != 0)
        goto LAB37;

LAB38:    t69 = *((unsigned int *)t11);
    t70 = *((unsigned int *)t60);
    t71 = (t69 | t70);
    *((unsigned int *)t68) = t71;
    t72 = (t11 + 4);
    t73 = (t60 + 4);
    t74 = (t68 + 4);
    t75 = *((unsigned int *)t72);
    t76 = *((unsigned int *)t73);
    t77 = (t75 | t76);
    *((unsigned int *)t74) = t77;
    t78 = *((unsigned int *)t74);
    t79 = (t78 != 0);
    if (t79 == 1)
        goto LAB39;

LAB40:
LAB41:    goto LAB30;

LAB33:    t59 = (t46 + 4);
    *((unsigned int *)t46) = 1;
    *((unsigned int *)t59) = 1;
    goto LAB34;

LAB35:    *((unsigned int *)t60) = 1;
    goto LAB38;

LAB37:    t67 = (t60 + 4);
    *((unsigned int *)t60) = 1;
    *((unsigned int *)t67) = 1;
    goto LAB38;

LAB39:    t80 = *((unsigned int *)t68);
    t81 = *((unsigned int *)t74);
    *((unsigned int *)t68) = (t80 | t81);
    t82 = (t11 + 4);
    t83 = (t60 + 4);
    t84 = *((unsigned int *)t82);
    t85 = (~(t84));
    t86 = *((unsigned int *)t11);
    t87 = (t86 & t85);
    t88 = *((unsigned int *)t83);
    t89 = (~(t88));
    t90 = *((unsigned int *)t60);
    t91 = (t90 & t89);
    t92 = (~(t87));
    t93 = (~(t91));
    t94 = *((unsigned int *)t74);
    *((unsigned int *)t74) = (t94 & t92);
    t95 = *((unsigned int *)t74);
    *((unsigned int *)t74) = (t95 & t93);
    goto LAB41;

LAB42:    xsi_set_current_line(32, ng0);
    t102 = ((char*)((ng5)));
    t103 = (t0 + 1608);
    xsi_vlogvar_assign_value(t103, t102, 0, 0, 4);
    goto LAB44;

LAB47:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB48;

LAB49:    xsi_set_current_line(34, ng0);
    t9 = ((char*)((ng7)));
    t10 = (t0 + 1608);
    xsi_vlogvar_assign_value(t10, t9, 0, 0, 4);
    goto LAB51;

}


extern void work_m_00000000003245327721_1947578403_init()
{
	static char *pe[] = {(void *)Always_26_0};
	xsi_register_didat("work_m_00000000003245327721_1947578403", "isim/wrapper_RISC_fib_test_isim_beh.exe.sim/work/m_00000000003245327721_1947578403.didat");
	xsi_register_executes(pe);
}
