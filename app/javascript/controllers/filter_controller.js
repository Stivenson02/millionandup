import ApplicationController from './application_controller'

/* This is the custom StimulusReflex controller for the Filter Reflex.
 * Learn more at: https://docs.stimulusreflex.com
 */
export default class extends ApplicationController {
  /*
   * Regular Stimulus lifecycle methods
   * Learn more at: https://stimulusjs.org/reference/lifecycle-callbacks
   *
   * If you intend to use this controller as a regular stimulus controller as well,
   * make sure any Stimulus lifecycle methods overridden in ApplicationController call super.
   *
   * Important:
   * By default, StimulusReflex overrides the -connect- method so make sure you
   * call super if you intend to do anything else when this controller connects.
  */

  connect () {
    super.connect()
    // add your code here, if applicable
  }

  /* Reflex specific lifecycle methods.
   *
   * For every method defined in your Reflex class, a matching set of lifecycle methods become available
   * in this javascript controller. These are optional, so feel free to delete these stubs if you don't
   * need them.
   *
   * Important:
   * Make sure to add data-controller="filter" to your markup alongside
   * data-reflex="Filter#dance" for the lifecycle methods to fire properly.
   *
   * Example:
   *
   *   <a href="#" data-reflex="click->Filter#dance" data-controller="filter">Dance!</a>
   *
   * Arguments:
   *
   *   element - the element that triggered the reflex
   *             may be different than the Stimulus controller's this.element
   *
   *   reflex - the name of the reflex e.g. "Filter#dance"
   *
   *   error/noop - the error message (for reflexError), otherwise null
   *
   *   reflexId - a UUID4 or developer-provided unique identifier for each Reflex
   */

  // beforeApplyFilter(element, reflex, noop, reflexId) {
  //  console.log("before apply_filter", element, reflex, reflexId)
  // }

  // applyFilterSuccess(element, reflex, noop, reflexId) {
  //   console.log("apply_filter success", element, reflex, reflexId)
  // }

  // applyFilterError(element, reflex, error, reflexId) {
  //   console.error("apply_filter error", element, reflex, error, reflexId)
  // }

  // applyFilterHalted(element, reflex, noop, reflexId) {
  //   console.warn("apply_filter halted", element, reflex, reflexId)
  // }

  // afterApplyFilter(element, reflex, noop, reflexId) {
  //   console.log("after apply_filter", element, reflex, reflexId)
  // }

  // finalizeApplyFilter(element, reflex, noop, reflexId) {
  //   console.log("finalize apply_filter", element, reflex, reflexId)
  // }
}
