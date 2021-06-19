namespace Calendar\Entities;


class EventType {
    private ?\Calendar\Values\BookingConfiguration $config = null;

    public function __construct(
        private string $name,
        private string $description = '',
        private bool $active = true,
        private string $slug = '',
        private string $id = '',
    ) {
        $this->slug = $slug ? $slug : \Calendar\Utils\slugify($name);

        $avail = new \Calendar\Values\Availability(\Calendar\Day::FRIDAY, "2021-10-10", "2021-10-31");
        $avilabilities = Vector {$avail};
        $this->config = new \Calendar\Values\BookingConfiguration("asia/uae", $avilabilities);
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
