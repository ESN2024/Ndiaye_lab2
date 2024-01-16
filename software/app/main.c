#include "system.h"
#include "altera_avalon_timer_regs.h"
#include "altera_avalon_timer.h"
#include "altera_avalon_pio_regs.h"
#include "sys/alt_stdio.h"
#include "sys/alt_irq.h"
#include "alt_types.h"
#include "sys/alt_sys_init.h"
#include <stdio.h>
#include <unistd.h>

volatile __uint8_t u=0,d=0,c=0;

volatile __uint16_t cnt=990;

void simple_irq()
{
	cnt++;
	alt_printf("Start\n\r");
		
	c=cnt/100;
	d=(cnt%100)/10;
	u=cnt%10;
	
	IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE,u);//data 
	IOWR_ALTERA_AVALON_PIO_DATA(PIO_1_BASE,d);//data 
	IOWR_ALTERA_AVALON_PIO_DATA(PIO_2_BASE,c);//data
	
	IOWR_ALTERA_AVALON_TIMER_STATUS(TIMER_0_BASE,0x01);
	
}

int main(void)
{
	
	// Init Timer 

	IOWR_ALTERA_AVALON_TIMER_CONTROL (TIMER_0_BASE, 0x07 ); 
	
	// Register IRQ
	
	alt_irq_register(TIMER_0_IRQ,NULL,simple_irq);
	
	while(1);

	
	return 0;
}