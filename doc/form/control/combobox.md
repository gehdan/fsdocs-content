# ComboBox

* [Properties/Events](xref:FrameworkSystems.FrameworkStudio.General.DevObjects.Form.Designer.ViewModels.ComboboxDesignViewModel)

* [Actions](xref:FrameworkSystems.FrameworkControls.Actions.ComboBoxControlAction)

## Lazy-Loading

Wenn ein Form Comboboxen beinhaltet, die sehr viele Listen-Einträge besitzen, dann kann das zu spürbaren Verzögerungen in der Anwendung führen, weil diese Listen zum einen im XML kommuniziert und auch vom Client aufbereitet werden müssen.

Für diesen Fall gibt es einen neuen Mechanismus, bei dem solche Combobox-Listen erst bei Bedarf an den Client übertragen werden - und zwar dann, wenn die Combobox aufgeklappt wird. Comboboxen mit bis zu 50 Listen-Einträgen werden weiterhin komplett übertragen. Bei so kleinen Listen würde sich eine extra Anfrage an den Broker nicht rechnen.
