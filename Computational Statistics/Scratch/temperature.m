x = csvread('temperature.csv');
[xx, f] = kernel_density(x);

c2f = @(x) (x * 9/5) + 32;

school = 'Arizona State University';
x2 = csvread(strcat(school, '.csv'));
plot_other(c2f(x2), f, xx, school);

school = 'Stanford University';
x2 = csvread(strcat(school, '.csv'));
plot_other(c2f(x2), f, xx, school);

school = 'University of California, San Diego';
x2 = csvread(strcat(school, '.csv'));
plot_other(c2f(x2), f, xx, school);

school = 'University of California, Berkeley';
x2 = csvread(strcat(school, '.csv'));
plot_other(c2f(x2), f, xx, school);

figure
school = 'University of Southern California';
x2 = csvread(strcat(school, '.csv'));
plot_other(c2f(x2), f, xx, school);

figure
school = 'University of Texas at Austin';
x2 = csvread(strcat(school, '.csv'));
plot_other(c2f(x2), f, xx, school);


figure
school = 'Carnegie Mellon University';
x2 = csvread(strcat(school, '.csv'));
plot_other(c2f(x2), f, xx, school);

figure
school = 'University of Illinois at Urbana-Champaign';
x2 = csvread(strcat(school, '.csv'));
plot_other(c2f(x2), f, xx, school);



