namespace Calendar\Entities;


use Calendar\Values\Availability;
use Calendar\Values\BookingConfiguration;
use Calendar\Day;
use Calendar\Utils;


class EventType extends Entity {
    private ?BookingConfiguration $config = null;

    public function __construct(
        private string $name,
        private string $description = '',
        private bool $active = true,
        private string $slug = '',
        private string $id = '',
    ) {
        parent::__construct($id);

        $this->slug = $slug ? $slug : Utils\slugify($name);

        // TODO remove this code as it's added mainly for testing purpose
        $avail = new Availability(Day::FRIDAY, "2021-10-10", "2021-10-31");
        $avilabilities = Vector {$avail};
        $this->config = new BookingConfiguration("asia/uae", $avilabilities);
    }

    public function __toString(): string {
        $status = $this->active ? 'ON' : 'OFF';
        return $this->config != null
            ?
            '<Event: ' . $this->slug . ' ' . $status . ' ' . $this->config . '>'
            :
            '<Event: ' . $this->slug . ' ' . $status . '>'
            ;
    }
}
