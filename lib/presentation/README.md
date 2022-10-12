# package for the vews and its viewmodels

If a view has a Model the only purpose of that model will be to show different states of the view UI.
The view's model will notify its changes in state to the view and it will re-render only the area that it is necessary. If more than one area is being re-rendered, consider separating it in a different view+model.


“Gather together the things that change for the same reasons. Separate those things that change for different reasons.”
