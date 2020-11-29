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

/* This file is designed for use with ISim build 0xc3576ebc */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Xilinx/LABS/LAB3/lab3/MUX32x8.vhd";



static void work_a_4117826039_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned char t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;

LAB0:    xsi_set_current_line(44, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 4630);
    t4 = 1;
    if (2U == 2U)
        goto LAB5;

LAB6:    t4 = 0;

LAB7:    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 4632);
    t4 = 1;
    if (2U == 2U)
        goto LAB13;

LAB14:    t4 = 0;

LAB15:    if (t4 != 0)
        goto LAB11;

LAB12:    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 4634);
    t4 = 1;
    if (2U == 2U)
        goto LAB21;

LAB22:    t4 = 0;

LAB23:    if (t4 != 0)
        goto LAB19;

LAB20:    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 4636);
    t4 = 1;
    if (2U == 2U)
        goto LAB29;

LAB30:    t4 = 0;

LAB31:    if (t4 != 0)
        goto LAB27;

LAB28:    xsi_set_current_line(76, ng0);
    t1 = (t0 + 4638);
    t3 = (t0 + 2912);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 8U);
    xsi_driver_first_trans_fast_port(t3);

LAB3:    t1 = (t0 + 2832);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(44, ng0);
    t8 = (t0 + 1032U);
    t9 = *((char **)t8);
    t10 = (0 - 31);
    t11 = (t10 * -1);
    t12 = (1U * t11);
    t13 = (0 + t12);
    t8 = (t9 + t13);
    t14 = *((unsigned char *)t8);
    t15 = (t0 + 2912);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    *((unsigned char *)t19) = t14;
    xsi_driver_first_trans_delta(t15, 7U, 1, 0LL);
    xsi_set_current_line(45, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t10 = (1 - 31);
    t5 = (t10 * -1);
    t11 = (1U * t5);
    t12 = (0 + t11);
    t1 = (t2 + t12);
    t4 = *((unsigned char *)t1);
    t3 = (t0 + 2912);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t4;
    xsi_driver_first_trans_delta(t3, 6U, 1, 0LL);
    xsi_set_current_line(46, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t10 = (2 - 31);
    t5 = (t10 * -1);
    t11 = (1U * t5);
    t12 = (0 + t11);
    t1 = (t2 + t12);
    t4 = *((unsigned char *)t1);
    t3 = (t0 + 2912);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t4;
    xsi_driver_first_trans_delta(t3, 5U, 1, 0LL);
    xsi_set_current_line(47, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t10 = (3 - 31);
    t5 = (t10 * -1);
    t11 = (1U * t5);
    t12 = (0 + t11);
    t1 = (t2 + t12);
    t4 = *((unsigned char *)t1);
    t3 = (t0 + 2912);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t4;
    xsi_driver_first_trans_delta(t3, 4U, 1, 0LL);
    xsi_set_current_line(48, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t10 = (4 - 31);
    t5 = (t10 * -1);
    t11 = (1U * t5);
    t12 = (0 + t11);
    t1 = (t2 + t12);
    t4 = *((unsigned char *)t1);
    t3 = (t0 + 2912);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t4;
    xsi_driver_first_trans_delta(t3, 3U, 1, 0LL);
    xsi_set_current_line(49, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t10 = (5 - 31);
    t5 = (t10 * -1);
    t11 = (1U * t5);
    t12 = (0 + t11);
    t1 = (t2 + t12);
    t4 = *((unsigned char *)t1);
    t3 = (t0 + 2912);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t4;
    xsi_driver_first_trans_delta(t3, 2U, 1, 0LL);
    xsi_set_current_line(50, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t10 = (6 - 31);
    t5 = (t10 * -1);
    t11 = (1U * t5);
    t12 = (0 + t11);
    t1 = (t2 + t12);
    t4 = *((unsigned char *)t1);
    t3 = (t0 + 2912);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t4;
    xsi_driver_first_trans_delta(t3, 1U, 1, 0LL);
    xsi_set_current_line(51, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t10 = (7 - 31);
    t5 = (t10 * -1);
    t11 = (1U * t5);
    t12 = (0 + t11);
    t1 = (t2 + t12);
    t4 = *((unsigned char *)t1);
    t3 = (t0 + 2912);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t4;
    xsi_driver_first_trans_delta(t3, 0U, 1, 0LL);
    goto LAB3;

LAB5:    t5 = 0;

LAB8:    if (t5 < 2U)
        goto LAB9;
    else
        goto LAB7;

LAB9:    t6 = (t2 + t5);
    t7 = (t1 + t5);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB6;

LAB10:    t5 = (t5 + 1);
    goto LAB8;

LAB11:    xsi_set_current_line(52, ng0);
    t8 = (t0 + 1032U);
    t9 = *((char **)t8);
    t10 = (8 - 31);
    t11 = (t10 * -1);
    t12 = (1U * t11);
    t13 = (0 + t12);
    t8 = (t9 + t13);
    t14 = *((unsigned char *)t8);
    t15 = (t0 + 2912);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    *((unsigned char *)t19) = t14;
    xsi_driver_first_trans_delta(t15, 7U, 1, 0LL);
    xsi_set_current_line(53, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t10 = (9 - 31);
    t5 = (t10 * -1);
    t11 = (1U * t5);
    t12 = (0 + t11);
    t1 = (t2 + t12);
    t4 = *((unsigned char *)t1);
    t3 = (t0 + 2912);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t4;
    xsi_driver_first_trans_delta(t3, 6U, 1, 0LL);
    xsi_set_current_line(54, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t10 = (10 - 31);
    t5 = (t10 * -1);
    t11 = (1U * t5);
    t12 = (0 + t11);
    t1 = (t2 + t12);
    t4 = *((unsigned char *)t1);
    t3 = (t0 + 2912);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t4;
    xsi_driver_first_trans_delta(t3, 5U, 1, 0LL);
    xsi_set_current_line(55, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t10 = (11 - 31);
    t5 = (t10 * -1);
    t11 = (1U * t5);
    t12 = (0 + t11);
    t1 = (t2 + t12);
    t4 = *((unsigned char *)t1);
    t3 = (t0 + 2912);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t4;
    xsi_driver_first_trans_delta(t3, 4U, 1, 0LL);
    xsi_set_current_line(56, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t10 = (12 - 31);
    t5 = (t10 * -1);
    t11 = (1U * t5);
    t12 = (0 + t11);
    t1 = (t2 + t12);
    t4 = *((unsigned char *)t1);
    t3 = (t0 + 2912);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t4;
    xsi_driver_first_trans_delta(t3, 3U, 1, 0LL);
    xsi_set_current_line(57, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t10 = (13 - 31);
    t5 = (t10 * -1);
    t11 = (1U * t5);
    t12 = (0 + t11);
    t1 = (t2 + t12);
    t4 = *((unsigned char *)t1);
    t3 = (t0 + 2912);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t4;
    xsi_driver_first_trans_delta(t3, 2U, 1, 0LL);
    xsi_set_current_line(58, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t10 = (14 - 31);
    t5 = (t10 * -1);
    t11 = (1U * t5);
    t12 = (0 + t11);
    t1 = (t2 + t12);
    t4 = *((unsigned char *)t1);
    t3 = (t0 + 2912);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t4;
    xsi_driver_first_trans_delta(t3, 1U, 1, 0LL);
    xsi_set_current_line(59, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t10 = (15 - 31);
    t5 = (t10 * -1);
    t11 = (1U * t5);
    t12 = (0 + t11);
    t1 = (t2 + t12);
    t4 = *((unsigned char *)t1);
    t3 = (t0 + 2912);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t4;
    xsi_driver_first_trans_delta(t3, 0U, 1, 0LL);
    goto LAB3;

LAB13:    t5 = 0;

LAB16:    if (t5 < 2U)
        goto LAB17;
    else
        goto LAB15;

LAB17:    t6 = (t2 + t5);
    t7 = (t1 + t5);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB14;

LAB18:    t5 = (t5 + 1);
    goto LAB16;

LAB19:    xsi_set_current_line(60, ng0);
    t8 = (t0 + 1032U);
    t9 = *((char **)t8);
    t10 = (16 - 31);
    t11 = (t10 * -1);
    t12 = (1U * t11);
    t13 = (0 + t12);
    t8 = (t9 + t13);
    t14 = *((unsigned char *)t8);
    t15 = (t0 + 2912);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    *((unsigned char *)t19) = t14;
    xsi_driver_first_trans_delta(t15, 7U, 1, 0LL);
    xsi_set_current_line(61, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t10 = (17 - 31);
    t5 = (t10 * -1);
    t11 = (1U * t5);
    t12 = (0 + t11);
    t1 = (t2 + t12);
    t4 = *((unsigned char *)t1);
    t3 = (t0 + 2912);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t4;
    xsi_driver_first_trans_delta(t3, 6U, 1, 0LL);
    xsi_set_current_line(62, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t10 = (18 - 31);
    t5 = (t10 * -1);
    t11 = (1U * t5);
    t12 = (0 + t11);
    t1 = (t2 + t12);
    t4 = *((unsigned char *)t1);
    t3 = (t0 + 2912);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t4;
    xsi_driver_first_trans_delta(t3, 5U, 1, 0LL);
    xsi_set_current_line(63, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t10 = (19 - 31);
    t5 = (t10 * -1);
    t11 = (1U * t5);
    t12 = (0 + t11);
    t1 = (t2 + t12);
    t4 = *((unsigned char *)t1);
    t3 = (t0 + 2912);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t4;
    xsi_driver_first_trans_delta(t3, 4U, 1, 0LL);
    xsi_set_current_line(64, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t10 = (20 - 31);
    t5 = (t10 * -1);
    t11 = (1U * t5);
    t12 = (0 + t11);
    t1 = (t2 + t12);
    t4 = *((unsigned char *)t1);
    t3 = (t0 + 2912);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t4;
    xsi_driver_first_trans_delta(t3, 3U, 1, 0LL);
    xsi_set_current_line(65, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t10 = (21 - 31);
    t5 = (t10 * -1);
    t11 = (1U * t5);
    t12 = (0 + t11);
    t1 = (t2 + t12);
    t4 = *((unsigned char *)t1);
    t3 = (t0 + 2912);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t4;
    xsi_driver_first_trans_delta(t3, 2U, 1, 0LL);
    xsi_set_current_line(66, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t10 = (22 - 31);
    t5 = (t10 * -1);
    t11 = (1U * t5);
    t12 = (0 + t11);
    t1 = (t2 + t12);
    t4 = *((unsigned char *)t1);
    t3 = (t0 + 2912);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t4;
    xsi_driver_first_trans_delta(t3, 1U, 1, 0LL);
    xsi_set_current_line(67, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t10 = (23 - 31);
    t5 = (t10 * -1);
    t11 = (1U * t5);
    t12 = (0 + t11);
    t1 = (t2 + t12);
    t4 = *((unsigned char *)t1);
    t3 = (t0 + 2912);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t4;
    xsi_driver_first_trans_delta(t3, 0U, 1, 0LL);
    goto LAB3;

LAB21:    t5 = 0;

LAB24:    if (t5 < 2U)
        goto LAB25;
    else
        goto LAB23;

LAB25:    t6 = (t2 + t5);
    t7 = (t1 + t5);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB22;

LAB26:    t5 = (t5 + 1);
    goto LAB24;

LAB27:    xsi_set_current_line(68, ng0);
    t8 = (t0 + 1032U);
    t9 = *((char **)t8);
    t10 = (24 - 31);
    t11 = (t10 * -1);
    t12 = (1U * t11);
    t13 = (0 + t12);
    t8 = (t9 + t13);
    t14 = *((unsigned char *)t8);
    t15 = (t0 + 2912);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    *((unsigned char *)t19) = t14;
    xsi_driver_first_trans_delta(t15, 7U, 1, 0LL);
    xsi_set_current_line(69, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t10 = (25 - 31);
    t5 = (t10 * -1);
    t11 = (1U * t5);
    t12 = (0 + t11);
    t1 = (t2 + t12);
    t4 = *((unsigned char *)t1);
    t3 = (t0 + 2912);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t4;
    xsi_driver_first_trans_delta(t3, 6U, 1, 0LL);
    xsi_set_current_line(70, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t10 = (26 - 31);
    t5 = (t10 * -1);
    t11 = (1U * t5);
    t12 = (0 + t11);
    t1 = (t2 + t12);
    t4 = *((unsigned char *)t1);
    t3 = (t0 + 2912);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t4;
    xsi_driver_first_trans_delta(t3, 5U, 1, 0LL);
    xsi_set_current_line(71, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t10 = (27 - 31);
    t5 = (t10 * -1);
    t11 = (1U * t5);
    t12 = (0 + t11);
    t1 = (t2 + t12);
    t4 = *((unsigned char *)t1);
    t3 = (t0 + 2912);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t4;
    xsi_driver_first_trans_delta(t3, 4U, 1, 0LL);
    xsi_set_current_line(72, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t10 = (28 - 31);
    t5 = (t10 * -1);
    t11 = (1U * t5);
    t12 = (0 + t11);
    t1 = (t2 + t12);
    t4 = *((unsigned char *)t1);
    t3 = (t0 + 2912);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t4;
    xsi_driver_first_trans_delta(t3, 3U, 1, 0LL);
    xsi_set_current_line(73, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t10 = (29 - 31);
    t5 = (t10 * -1);
    t11 = (1U * t5);
    t12 = (0 + t11);
    t1 = (t2 + t12);
    t4 = *((unsigned char *)t1);
    t3 = (t0 + 2912);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t4;
    xsi_driver_first_trans_delta(t3, 2U, 1, 0LL);
    xsi_set_current_line(74, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t10 = (30 - 31);
    t5 = (t10 * -1);
    t11 = (1U * t5);
    t12 = (0 + t11);
    t1 = (t2 + t12);
    t4 = *((unsigned char *)t1);
    t3 = (t0 + 2912);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t4;
    xsi_driver_first_trans_delta(t3, 1U, 1, 0LL);
    xsi_set_current_line(75, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t10 = (31 - 31);
    t5 = (t10 * -1);
    t11 = (1U * t5);
    t12 = (0 + t11);
    t1 = (t2 + t12);
    t4 = *((unsigned char *)t1);
    t3 = (t0 + 2912);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t4;
    xsi_driver_first_trans_delta(t3, 0U, 1, 0LL);
    goto LAB3;

LAB29:    t5 = 0;

LAB32:    if (t5 < 2U)
        goto LAB33;
    else
        goto LAB31;

LAB33:    t6 = (t2 + t5);
    t7 = (t1 + t5);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB30;

LAB34:    t5 = (t5 + 1);
    goto LAB32;

}


extern void work_a_4117826039_3212880686_init()
{
	static char *pe[] = {(void *)work_a_4117826039_3212880686_p_0};
	xsi_register_didat("work_a_4117826039_3212880686", "isim/testTop_isim_beh.exe.sim/work/a_4117826039_3212880686.didat");
	xsi_register_executes(pe);
}
