#include<stdio.h>

int main() {
	int i, mem, ps[100], pa[100], np = 0;
	char nextProcess = 'y';

	printf("Enter the total mem. avil. (in bytes): ");
	scanf("%d", &mem);

	while (nextProcess == 'y')
	{
		int s = 0;
		printf("\n");
		printf("Enter mem. req. for process %d (in bytes): ", np + 1);
		scanf("%d", &s);
		ps[np] = s;
		if (mem >= s)
		{
			mem -= s;
			pa[np] = 1;
			printf("Memory is allocated for process %d", np + 1);
			np++;
		}
		else
		{
			pa[np] = 0;
			printf("Couldn't allocate mem. for process %d", np + 1);
			np++;
			break;
		}
		printf("\n");
		printf("Do you want to continue(y/n): ");
		scanf(" %c", &nextProcess);
	}
	
	printf("\n");
	
	printf("\nPROCESS\t\tPROCESS SIZE\t\tALLOCATED");
	for(i = 0; i < np; i++) {
		if (pa[i] == 1)
		{
			printf("\n%d \t\t %d \t\t\t YES ", i + 1, ps[i]);
		}
		else
		{
			printf("\n%d \t\t %d \t\t\t NO ", i + 1, ps[i]);
		}
	}

	printf("\n\nExternal Fragmentation: %d\n", mem);
	
	return 0;
}
