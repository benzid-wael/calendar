namespace Calendar\Values;


use namespace HH\Lib\Vec;
use namespace HH\Lib\C;


class BookingConfiguration {
    private InviteeVisibility $visibility;

    public function __construct(
        private string $timezone,
        private Vector<Availability> $availabilities,
        ?InviteeVisibility $visibility = null,
        private int $durationInMinutes = 30,
        private int $beforeBufferInMinutes = 0,
        private int $afterBufferInMinutes = 0,
    ) {
        $this->visibility = new UnlimitedInviteeVisibility();
    }

    public function __toString(): string {
        $slots = C\count($this->availabilities) > 1 ? C\count($this->availabilities) . ' slots' : C\count($this->availabilities) . ' slot';
        return '<'.$this->visibility->name().'; '.$slots.'>';
    }
}