#include <stdio.h>
#include <stdlib.h>
float f;
int main(int argc, char *argv[])
{
	if (argc > 1)
	{
		if (argv[1][0]=='-' && argv[1][1]=='s')
		{
			if (argc != 3 && argc != 4)
			{
				printf("usage: [-s] %s freq [comment]\n",argv[0]);
				return 1;
			}
			f = 2048 - (131072)/atof(argv[2]);
			if (argc==4)
        	        	printf("  .word   %0.0f   @ %s\n",f,argv[3]);
			if (argc==3)
				printf("  .word   %0.0f\n",f);
		
			return 0;
		}
	}
	if (argc == 2)
	{

		f = 2048 - (131072)/atof(argv[1]);
	
		printf ("%0.0f\n",f);
		return 0;
	}
	printf("usage: [-s] %s freq [comment]\n",argv[0]);
	
	return 1;
}
