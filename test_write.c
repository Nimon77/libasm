/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test_write.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nsimon <nsimon@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/08/15 12:04:11 by nsimon            #+#    #+#             */
/*   Updated: 2020/08/15 12:04:13 by nsimon           ###   ########.fr       */
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
    if (argc > 1)
    {
        retvalue = ft_write(atoi(argv[1]), argv[2], ft_strlen(argv[2]));
        printf("\n%d\n", retvalue);
        if (retvalue == -1)
        {
            fprintf(stderr, "Value of errno: %d\n", errno);
            perror("Error printed by perror");
        }
    }
    return 0;
}
