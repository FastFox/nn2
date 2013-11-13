function task_1()
    starting_point = repmat([-1,1],100,1) + 0.5*randn(100,2);
   
    options = foptions;         % Standard options
    options(1) = -1;            % Turn off printing completely
    options(3) = 1e-8;          % Tolerance in value of function
    options(14) = 100000;          % Max. 100 iterations of algorithm
    options(18) = 0.001;         % Learning rate    
    
    default_options = options;
    
    results = zeros(100,5,4);   %experiment, algorithm, output (1=eval, 2=gradeval,3=runtime,4=successrate)
    
    functionList = {@graddesc, @graddesc, @scg, @conjgrad, @quasinew};

    plotdinges = zeros(100,2,5);
    
    for i = 1:100
        disp(i);
        for j = 1:2
            options = default_options;
            if(j==1 || j==2)
                options(18) = 0.008;
            end
            if(j==2)
                options(7) = 1;
            end
            tic;
            [dump, options, dump, plottest] = functionList{j}('rosen', starting_point(i,:), options, 'rosegrad');
            if(size(plottest,1)<100)
                for i=size(plottest,1):100
                    plottest(i,:) = [0 0];
                end
            end       
            if(options(10)>100)
                einde = 100;
            else
                einde = options(10);
            end
            
            plotdinges(1:einde,:,j) = plottest(1:einde,:); 
            
            time = toc;
            results(i,j,1) = options(10);
            results(i,j,2) = options(11);
            results(i,j,3) = time;
            results(i,j,4) = options(8);
        end 
    end  
      
    for i = 1:5
        disp(' ');
        disp(['Function ' num2str(i) ':']); 
        disp(['Average function evaluations: ' num2str(mean(results(:,i,1)))]);
        disp(['Average gradient evaluations: ' num2str(mean(results(:,i,2)))]);
        disp(['Average runtime: ' num2str(mean(results(:,i,3)))]);
        disp(['Average successrate: ' num2str(sum(results(:,i,4) < 0.0001)) '%']);
    end
    a = -1.5:.02:1.5;
    b = -0.5:.02:2.1;
    [A, B] = meshgrid(a, b);
    Z = rosen([A(:), B(:)]);
    Z = reshape(Z, length(b), length(a));
    l = -1:6;
    v = 2.^l;
    fh1 = figure;
    contour(a, b, Z, v)
    title('Contour plot of Rosenbrock''s function')
    hold on
    plot(nonzeros(plotdinges(:,1,1)), nonzeros(plotdinges(:,2,1)), 'r','LineWidth',3);
    plot(nonzeros(plotdinges(:,1,2)), nonzeros(plotdinges(:,2,2)), 'g','LineWidth',3);
    hold off
       
%     fh2 = figure;
%     contour(a, b, Z, v)
%     title('Contour plot of Rosenbrock''s function')
%     hold on    
%     plot(nonzeros(plotdinges(:,1,3)), nonzeros(plotdinges(:,2,3)), 'black','LineWidth',3)
%     plot(nonzeros(plotdinges(:,1,4)), nonzeros(plotdinges(:,2,4)), 'g','LineWidth',3)
%     plot(nonzeros(plotdinges(:,1,5)), nonzeros(plotdinges(:,2,5)), 'y', 'LineWidth',3)    
%     hold off
end