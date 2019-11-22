/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: sdunckel <sdunckel@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/22 11:59:40 by sdunckel          #+#    #+#             */
/*   Updated: 2019/11/22 18:21:55 by sdunckel         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <stdio.h>
#include <fcntl.h>

void 	start(void);
void 	ft_write(unsigned int fd, const char *buf, size_t count);
int		ft_read(unsigned int fd, const char *buf, size_t count);
size_t	ft_strlen(const char *s);
int		main(void)
{
	int		fd;
	int		ret;
	char	buf[256];

	/*
	FT_WRITE
	*/
	write(1, "test\n", 4);
	ft_write(1, "test\n", 4);
	write(1, "n", 1);
	ft_write(1, "n", 1);
	ft_write(1, "\n", 1);

	/*
	FT_READ
	*/
	fd = open("main.c", O_RDONLY);
	ret = read(fd, buf, 256);
	buf[ret] = '\0';
	printf("%s\n", buf);
	close(fd);

	fd = open("main.c", O_RDONLY);
	ret = ft_read(fd, buf, 256);
	buf[ret] = '\0';
	printf("%s\n", buf);
	close(fd);

	/*
	FT_STRLEN
	*/

	printf("%lu\n", strlen(""));
	printf("%lu\n", ft_strlen(""));




	//start();
}
