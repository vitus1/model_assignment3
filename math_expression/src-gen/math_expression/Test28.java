package math_expression;
public class Test28 {

public int x;
public int y;

private External external;

public Test28(External external)
{
    this.external = external;
}

public void compute(){
	x=4;
	y=8;
}

public interface External {
	public int sqrt(int n);
}
}
