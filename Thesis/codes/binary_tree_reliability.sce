function [R_sys] = reliabilityCalc(lambda, c, n)
    //open a file
    fid = mopen("data.txt", "w");
    if (fid==-1) then
        error("cannot open the file")
    end
    
    t = [0:0.0001:1];
    //calc of reliability
    R = %e^(lambda*-t);
    //calc of reliability without redundancy
    R_nr = R .^ ((2^n)-1);
    
    //write file
    sR = size(R_nr);
    mfprintf(fid, "%ld\n",-255) ;
    for i = 1:sR(2)
        mfprintf(fid, "%f ", R_nr(i));
    end
    //calc Reliability of system with redundance for different c

//    figure();
  //  set(gca(),"auto_clear","off");
    //xlabel("time");
//    ylabel("Reliability");
    
   //plot(t, R_nr, "black");
    
    R_sys = null;
    r_int = 1;
    
    for j = 0:(n-1)
        k = j;
        r_int = r_int .* ((2^k * c + 1) - 2^k * c * R);        
    end
    
    R_sys = R_nr .* r_int;
    
    //size of R_sys
    sR = size(R_sys);
    mfprintf(fid, "%d\n", -255);
    
    for k = 1 : sR(2)
        mfprintf(fid, "%f", R_sys(k));
    end
    
    plot (t, R_sys, "r-");
    
    xlabel("Tiempo adimensional") 
    ylabel("Confiabilidad")
    f=get("current_figure") 
    f.background = 8;
    legend(['R(sys) con c = 1']);
    mclose(fid)
    
    return R_sys;
    
    //////////////////////////////////////////////////////////////////////
    l = size(c);    
    for i = 1:l(2)
      
        R_sys =null;
        r_int=1;
        for j = 0:(n-1)
    
            k = j;
            r_int = r_int .* (( 2^k * c(i) + 1) - 2^k * c(i) * R);

        end
       
        R_sys = R_nr .* r_int;   
        
        //size of R_sys
        sR = size(R_sys);
        mfprintf(fid, "%d\n", -255);
        
        
        //c  = 0.98
        if i==1 then
            for k=1:sR(2)
                mfprintf(fid, "%f ", R_sys(k));
            end
            plot(t, R_sys,"r--");            
        end
        
        //c = 0.99
        if i==2 then
            for k=1:sR(2)
                mfprintf(fid, "%f ", R_sys(k));
            end
            plot(t, R_sys,"b-.");            
        end
        //c = 1
        if i==3 then
            for k=1:sR(2)
                mfprintf(fid, "%f ", R_sys(k));
            end
            plot(t, R_sys,"cyan-+");            
        end        
    end
     
    legend(['R Not redundant';'C=0.98'; 'c=0.99'; 'c=1']);
    mclose(fid)
endfunction
