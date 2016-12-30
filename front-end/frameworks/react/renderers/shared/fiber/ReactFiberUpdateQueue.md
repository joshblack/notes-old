# `ReactFiberUpdateQueue`

## Types

#### `type UpdateQueue`

The `UpdateQueue` is a Singly Linked-List of updates. Whenever we need to schedule an update, it's added to the queue of the current fiber and work-in-progress fiber.

During reconciliation, updates are removed from the WIP Fiber, but they remain on the current fiber.

Key Notes:

- The WIP Queue is always a subset of the Current Queue
- When a tree is committed, the WIP Queue becomes the Current Queue

## Methods

#### `ensureUpdateQueue(fiber: Fiber): UpdateQueue`

Just checks if we already have `updateQueue` defined on the given `fiber`. If so, return it. Otherwise, construct a new `UpdateQueue` depending on if we're in `__DEV__` or not.

#### `insertUpdate(fiber: Fiber, update: Update, methodName: ?string): Update | null`

## Module

This module imports the following modules:

```js
const {
  Callback: CallbackEffect
} = require('ReactTypeOfSideEffect');
const {
  NoWork,
  SynchronousPriority,
  TaskPriority
} = require('ReactPriorityLevel');
const warning = require('warning');
```

This module imports the following types:

```js
import type { Fiber } from 'ReactFiber';
import type { PriorityLevel } from 'ReactPriorityLevel';
```

This module leverages the following local types:

```js
type PartialState<State, Props> = $Subtype<State> | (prevState: State, props: Props) => $Subtype<State>;

type Callback = () => void;

type Update = {
  priorityLevel: PriorityLevel;
  partialState: PartialState<any, any>;
  callback: Callback | null;
  isReplace: boolean;
  isForced: boolean;
  isTopLevelUnmount: boolean;
  next: Update | null;
};

// Singly linked-list of updates. When an update is scheduled, it is added to
// the queue of the current fiber and the work-in-progress fiber. The two queues
// are separate but they share a persistent structure.
//
// During reconciliation, updates are removed from the work-in-progress fiber,
// but they remain on the current fiber. That ensures that if a work-in-progress
// is aborted, the aborted updates are recovered by cloning from current.
//
// The work-in-progress queue is always a subset of the current queue.
//
// When the tree is committed, the work-in-progress becomes the current.
type UpdateQueue = {
  first: Update | null;
  last: Update | null;
  hasForceUpdate: boolean;

  // Dev only
  isProcessing?: boolean;
};
```

Finally, this module exposes the following exports:

```js
exports.cloneUpdateQueue = cloneUpdateQueue;
exports.addUpdate = addUpdate;
exports.addReplaceUpdate = addReplaceUpdate;
exports.addForceUpdate = addForceUpdate;
exports.getPendingPriority = getPendingPriority;
exports.addTopLevelUpdate = addTopLevelUpdate;
exports.beginUpdateQueue = beginUpdateQueue;
exports.commitCallbacks = commitCallbacks;
```

And exports the following types:

```js
// Singly linked-list of updates. When an update is scheduled, it is added to
// the queue of the current fiber and the work-in-progress fiber. The two queues
// are separate but they share a persistent structure.
//
// During reconciliation, updates are removed from the work-in-progress fiber,
// but they remain on the current fiber. That ensures that if a work-in-progress
// is aborted, the aborted updates are recovered by cloning from current.
//
// The work-in-progress queue is always a subset of the current queue.
//
// When the tree is committed, the work-in-progress becomes the current.
export type UpdateQueue = {
  first: Update | null;
  last: Update | null;
  hasForceUpdate: boolean // Dev only
  isProcessing?: boolean;
};
```
