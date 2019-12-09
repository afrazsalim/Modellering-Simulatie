function r0439731_plots(m,n,nnz,size_per_number)
    r =linspace(1,500,500);
    variable_plot = size_per_number*r*(m+n);
    fixed_plot = repmat((4*m)+(4*n)+(size_per_number*nnz),500);
    hold on;
    plot(r, variable_plot);
    plot(r,fixed_plot);
    intersection  = (2*nnz)/(m+n);
    legend("Lagerangbendaering","Coordinate format", "Intersection at"+ intersection);
    hold off;
end