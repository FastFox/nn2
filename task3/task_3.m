function output = task_3()
    load digits;
    func = 'softmax';


    for i = 1:100
        i
        tic
        %Confusion matrices
        cm = zeros(10);
        cm2 = zeros(10);        
        
        inputdata = [training testdata];
        inputdigits = [trainingd testdatad];
        perm = randperm(size(inputdata,2));

        inputdata = inputdata(:,perm);
        inputdigits = inputdigits(:,perm);

        training = inputdata(:,1:1707);
        trainingd = inputdigits(:,1:1707);
        testdata = inputdata(:,1708:end);
        testdatad = inputdigits(:,1708:end);   

        target_training = zeros(size(trainingd,2),10);
        output_training = zeros(size(trainingd,2),10);
        target_test = zeros(size(testdatad,2),10);
        output_test = zeros(size(testdatad,2),10);

        %Create the target vector from training data
        for j = 1:size(target_training,1)
            target_training(j, trainingd(j)+1) = 1;
        end        
        for j = 1:size(target_test,1)
            target_test(j, testdatad(j)+1) = 1;
        end   
        %Create the net
        net = mlp(256,75,10,func);
        %Train the nets
        options = foptions;
        options(14) = i;
        net = mlptrain(net, training', target_training, 50);
        %Test errors on training
        output_training = mlpfwd(net, training');
        for d=1:10
            for e=1:1707
                if round(output_training(e,d))==1 && trainingd(e)==d-1
                    cm(d,d) = cm(d,d) + 1;
                else
                    cm(trainingd(e)+1,d) = cm(trainingd(e)+1,d);
                end
            end    
        end
        %Test errors on testset
        output_test = mlpfwd(net, testdata');
        for d=1:10
            for e=1:1000
                if round(output_test(e,d))==1 && testdatad(e)==d-1
                    cm2(d,d) = cm2(d,d) + 1;
                else
                    cm2(testdatad(e)+1,d) = cm2(testdatad(e)+1,d);
                end
            end
        end
        cm
        disp(['Percentage correct: ' num2str((trace(cm)/1707)*100)]);
        cm2
        disp(['Percentage correct: ' num2str((trace(cm2)/1000)*100)]);
        output(i) = (trace(cm2)/1000)*100;      
    end
end