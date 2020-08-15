/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test_read.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nsimon <nsimon@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/08/15 12:03:21 by nsimon            #+#    #+#             */
/*   Updated: 2020/08/15 12:03:23 by nsimon           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include <stdio.h>
#include <errno.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char const *argv[])
{
    int retvalue;
    char buff[atoi(argv[2]) + 1];

    if (argc > 1)
    {
        retvalue = ft_read(atoi(argv[1]), &buff, atoi(argv[2]));
		buff[retvalue] = 0;
        printf("%s\n", buff);
        printf("\n%d\n", retvalue);
        if (retvalue == -1)
        {
            fprintf(stderr, "Value of errno: %d\n", errno);
            perror("Error printed by perror");
        }
    }
    return 0;
}
