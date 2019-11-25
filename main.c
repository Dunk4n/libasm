
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int		ft_strlen(char *str);

int		main(int ac, char **av)
{
	(void)ac;
	(void)av;
	printf("[%d]\n", ft_strlen(av[1]));
	return (0);
}
