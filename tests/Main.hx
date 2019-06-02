package ;

import tink.unit.TestBatch;
import tink.testrunner.Runner;

class Main {

    public static function main() {
        Runner.run(TestBatch.make([
            new base.BaseXSpec(),
            new base.Base16Spec(),
            new base.Base32Spec(),
            new base.Base64Spec(),
        ])).handle( Runner.exit );
    }

}