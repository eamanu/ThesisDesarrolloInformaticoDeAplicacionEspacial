function [R_sys] = calcRDistNet(lambda, c, v)
    
    t = [0:0.0001:1];
    R = %e ^{lambda * -t};
    
    R_tot = R^8;
    
    R_sys = 0.0;
    
    // todo ok
    R_sys = R_tot
    
    // falla un nodo
    R_sys1 = R_tot - ((1-(R_tot*c))^1)
    
    // falla dos nodos
    R_sys2 = R_tot - ((1-(R_tot*c))^2)
    
    // falla tres nodos
    R_sys3 = R_tot - ((1-(R_tot*c))^3)
    
    //falla cuatro nodos
    R_sys4 = R_tot - ((1-(R_tot*c))^4)


    R_sys_total = R_sys + R_sys1 + R_sys2 + R_sys3 + R_sys4
    
   // plot (t, R_sys, "b-");

   // xlabel("time")
   // ylabel("reliability")
   // f=get("current_figure") 
   // f.background = 8;
   // legend(['R(Distributed Net)'; 'R(Distributed Net) with 4 fail nodes']);
    
    return R_sys;
endfunction
