namespace Calendar;

use Calendar\Entities\EventType;


<<__EntryPoint>>
function main(): void {
  require_once(__DIR__.'/vendor/autoload.hack');
  \Facebook\AutoloadMap\initialize();

  echo "Welcome to Hack!\n\n";

  $event = new EventType("Mock Interview");

  /* HH_FIXME[4067] implicit __toString() is now deprecated */
  \printf("Event: %s \n\n", $event);

  exit(0);
}