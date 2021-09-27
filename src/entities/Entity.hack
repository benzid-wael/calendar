namespace Calendar\Entities;

use HH\Lib\SecureRandom;

use Calendar\Utils;


class Entity {
    private string $id;

    public function __construct(?string $id) {
        $this->id = $id ? $id : SecureRandom\string(16, "1234567890abcd");
    }
}