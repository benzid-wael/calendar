namespace Calendar\Values;


type Day = \Calendar\Day;

class Availability {
    public function __construct(private Day $day, private string $from, private string $to) {}
}