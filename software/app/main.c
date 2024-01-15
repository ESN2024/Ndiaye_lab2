#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "sys/alt_stdio.h"
#include "sys/alt_irq.h"
#include "alt_types.h"
#include "sys/alt_sys_init.h"
#include <stdio.h>
#include <unistd.h>

int main(void)
{
	__uint8_t cnt1=0,cnt2=0,cnt3=0;

	while(1)
	{
		IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE,cnt1);//data 
		IOWR_ALTERA_AVALON_PIO_DATA(PIO_1_BASE,cnt2);//data 
		IOWR_ALTERA_AVALON_PIO_DATA(PIO_2_BASE,cnt3);//data
		
		cnt1++;
		
		if(cnt1==10)
		{
			cnt1=0; 
			cnt2++;
		}
		
		if(cnt2==10)
		{
			cnt2=0;
			cnt3++;
		}
		
		if(cnt3==10)
		{
			cnt1=0;
			cnt2=0;
			cnt3=0;
		}
		usleep(200000);	
		
	}		
	
	return 0;
}