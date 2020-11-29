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

char *IEEE_P_2592010699;
char *STD_STANDARD;
char *IEEE_P_1242562249;
char *STD_TEXTIO;
char *IEEE_P_3620187407;
char *IEEE_P_3499444699;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    work_a_1433524865_3212880686_init();
    work_a_3240350266_3212880686_init();
    work_a_2646649696_3212880686_init();
    work_a_1139048893_3212880686_init();
    work_a_1970626851_3212880686_init();
    work_a_1077092816_3212880686_init();
    work_a_2726765264_3212880686_init();
    work_a_1982668953_3212880686_init();
    work_a_0438382571_3212880686_init();
    work_a_4232939542_3212880686_init();
    work_a_2564831407_3212880686_init();
    work_a_0445783411_3212880686_init();
    work_a_2585112374_3212880686_init();
    work_a_2023191012_3212880686_init();
    work_a_1033505401_3212880686_init();
    work_a_1753280202_3212880686_init();
    work_a_1572454722_3212880686_init();
    work_a_1254282497_3212880686_init();
    work_a_1934617028_3212880686_init();
    work_a_3024969381_3212880686_init();
    ieee_p_1242562249_init();
    std_textio_init();
    xilinxcorelib_a_0204279558_3212880686_init();
    work_a_3772128646_1178700139_init();
    work_a_0890142519_3212880686_init();
    work_a_3720066420_3212880686_init();
    work_a_2895730147_3212880686_init();
    work_a_4000226436_3212880686_init();
    work_a_3996100752_3212880686_init();
    work_a_3006959317_3212880686_init();
    work_a_3230344258_3212880686_init();
    work_a_3197592091_3212880686_init();
    work_a_2348334843_3212880686_init();
    work_a_4117826039_3212880686_init();
    work_a_2263464102_3212880686_init();
    work_a_0350822032_3212880686_init();
    work_a_1335952598_3212880686_init();
    work_a_1041121107_2372691052_init();


    xsi_register_tops("work_a_1041121107_2372691052");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");

    return xsi_run_simulation(argc, argv);

}
