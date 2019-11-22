/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: sdunckel <sdunckel@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/22 11:59:40 by sdunckel          #+#    #+#             */
/*   Updated: 2019/11/22 14:35:48 by sdunckel         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <stdio.h>

void 	start(void);
void 	ft_write(unsigned int fd, const char *buf, size_t count);

int		main(void)
{
	//char	test[] = "allo";
	ft_write(1, "test", 4);
	start();
}
