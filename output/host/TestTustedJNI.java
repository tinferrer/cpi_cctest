

public class TestTustedJNI {

    static {
	System.loadLibrary("TEST");
	//System.loadLibrary("cryptopp");
	//maybe load a collector library?
    }

    public static void main(String[] args) {
         System.out.println("1 will be increment to" + myNativeFunction(1));
    }
    private static native final int myNativeFunction(int a);
}
