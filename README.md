# Multi-target filters

Additional multi-target filters:

* `@spectators` - Spectators
* `@allies` - All players from USA team
* `@allies-alive` - Alive players from USA team
* `@allies-dead` - Dead players from USA team
* `@axis` - All players from German team
* `@axis-alive` - Alive players from German team
* `@axis-dead` - Dead players from German team

### Supported Games

* Day of Defeat: Source

### Installation

* Download latest [release](https://github.com/dronelektron/multi-target-filters/releases) (compiled for SourceMod 1.11)
* Extract "plugins" and "translations" folders to "addons/sourcemod" folder of your server

### Notes

To use these filters, add the following code to `OnPluginStart` of your plugin:

```
public void OnPluginStart() {
    // Other code

    if (LibraryExists("multi-target-filters")) {
        LoadTranslations("multi-target-filters.phrases");
    }
}
```
