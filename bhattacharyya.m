function d=bhattacharyya(X1,X2)

error(nargchk(2,2,nargin));
error(nargoutchk(0,1,nargout));

[n,m]=size(X1);

assert(size(X2,2)==m,'Dimension of X1 and X2 mismatch.');

mu1=mean(X1);
C1=cov(X1);
mu2=mean(X2);
C2=cov(X2);
C=(C1+C2)/2;
dmu=(mu1-mu2)/chol(C);
try
    d=0.125*dmu*dmu'+0.5*log(det(C/chol(C1*C2)));
catch
    if C1*C2==0
        d=0
    end
        
    d=0;
    
end
