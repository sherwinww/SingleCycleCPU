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
    xilinxcorelib_ver_m_00000000001067635404_2922664148_init();
    work_m_00000000003693808920_4046826282_init();
    xilinxcorelib_ver_m_00000000001067635404_2311688383_init();
    work_m_00000000004259014342_2013914457_init();
    work_m_00000000001758136058_0607241507_init();
    work_m_00000000001458432205_0886308060_init();
    work_m_00000000003862624122_4094291831_init();
    work_m_00000000000171191032_3230829578_init();
    work_m_00000000002191297720_0967167703_init();
    work_m_00000000004179432941_3823007873_init();
    work_m_00000000002332084212_3462089752_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000002332084212_3462089752");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
