function task_1()
    starting_point = repmat([-1,1],100,1) + 0.5*randn(100,2);
   
    options = foptions;         % Standard options
    options(1) = -1;            % Turn off printing completely
    options(3) = 1e-8;          % Tolerance in value of function
    options(14) = 100;          % Max. 100 iterations of algorithm
    options(18) = 0.001;         % Learning rate    
    
    default_options = options;
    
    results = zeros(100,5,4);   %experiment, algorithm, output (1=eval, 2=gradeval,3=runtime,4=successrate)
    
    functionList = {@graddesc, @graddesc, @scg, @conjgrad, @quasinew};
    
    for i = 1:100
        disp(i);
        for j = 1:5
            options = default_options;
            if(j==1 || j==2)
                options(18) = 0.008;
            end
            if(j==2)
                options(7) = 1;
            end
            tic;
            [dump, options, dump, dump] = functionList{j}('rosen', starting_point(i,:), options, 'rosegrad'); 
                        
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
end