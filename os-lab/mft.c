#include<stdio.h>

int main() {
	int i, totb, np;

	printf("Enter the block size: ");
	scanf("%d", &totb);
	printf("\n");
	int bs[totb], ba[totb];

	for (i = 0; i < totb; i++)
	{
		printf("Block %d size: ", i+1);
		scanf("%d", &bs[i]);
		ba[i] = 0;
	}
	printf("\n");
	
	printf("Enter the number of total process: ");
	scanf("%d", &np);
	printf("\n");

	int prm[np], pam[np], intf[np];
	
	for(i = 0; i < np; i++) {
		printf("Enter the memory required for process %d: ", i+1);
		scanf("%d", &prm[i]);
		pam[i] = 0;
		intf[i] = 0;
	}
	
	for (i = 0; i < np; i++)
	{
		for (int j = 0; j < totb; j++)
		{
			if (i > totb - 1)
			{
				pam[i] = 0;
				break;
			}
			if (ba[j] != 1 && (prm[i] <= bs[j]))
			{
				ba[j] = 1;
				pam[i] = 1;
				intf[i] = bs[j] - prm[i];
				break;
			}
		}
		
	}
	
	printf("\nPROCESS\t\tPROCESS SIZE\t\tBLOCK SIZE\t\tALLOCATED\t\tINT. FRAG.");
	for(i = 0; i < np; i++) {
		int bsize = bs[i];
		if (i > totb - 1)
		{
			bsize = 0;
		}
		if (pam[i] == 1)
		{
			printf("\n%d \t\t %d \t\t\t %d \t\t\t YES \t\t\t %d ", i, prm[i], bsize, intf[i]);
		}
		else
		{
			printf("\n%d \t\t %d \t\t\t %d \t\t\t NO  \t\t\t -- ", i, prm[i], bsize);
		}
	}

	printf("\n");
	
	return 0;
}
