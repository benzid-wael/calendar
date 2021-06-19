namespace Calendar\Values;


abstract class InviteeVisibility {
    protected static string $name = 'undefined';

    public function name(): string {
        // using static instead of self to ensure late static bindings
        return static::$name;
    }
}


class UnlimitedInviteeVisibility extends InviteeVisibility {
    protected static string $name = 'unlimited';

    public function __construct(private ?string $from = null) {}
}


class FixedWindowInviteeVisibility extends InviteeVisibility {
    protected static string $name = 'fixed';

    public function __construct(private string $from, private string $to) {}
}


class RollingInviteeVisibility extends InviteeVisibility {
    protected static string $name = 'rolling';

    public function __construct(private int $durationInDays) {}
}