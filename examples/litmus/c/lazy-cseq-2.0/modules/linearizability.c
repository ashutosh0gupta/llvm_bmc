// MAX_CLOCK should be the same as MAX_PUSHES to avoid the assume (*) in insert
#define MAX_PUSHES <insert-max_pushes-here>
#define MAX_ID_POP <insert-max_id_pop-here>
#define MAX_CLOCK <insert-max_clock-here>

typedef <insert-data_type> val_type;

unsigned char ids[MAX_PUSHES];
val_type values[MAX_PUSHES];
unsigned char finished[MAX_PUSHES];
unsigned char existence[MAX_PUSHES];
unsigned char time_at_call[MAX_PUSHES];
unsigned char time_at_return[MAX_PUSHES];

unsigned char clock = 0;
unsigned char saw_return = 0;

unsigned char pop_time_at_call[MAX_ID_POP];
_Bool saw_lp[MAX_ID_POP];

unsigned char nb_pushes_started_after_time[MAX_CLOCK];
unsigned char nb_pending_pushes_started_after_time[MAX_CLOCK];
unsigned char nb_pending_pushes_started_after_time_removed[MAX_CLOCK];

void __CSEQ_atomic_call_add_annotation(unsigned char id, val_type value) {
    unsigned char i;
    __CSEQ_assume ( 0 <= i & i < MAX_PUSHES );
    __CSEQ_assume ( existence[i] == 0 ); // & time_at_return[i] == 0
    // increments the clock if this call follows a return (i.e., clock counts the number of occurrences of return-call)
    clock += saw_return;
    saw_return = 0;
    //(*)__CSEQ_assume (clock < MAX_CLOCK);
    time_at_call[i] = clock;
    existence[i] = 1;
    ids[i] = id;
    values[i] = value;
    // from 0 to MAX_CLOCK-1; nb_pushes_started_after_time[i] = # pushes that started after time i
<update-nb_pushes-increment>

    // from 0 to MAX_CLOCK-1; nb_pending_pushes_started_after_time[i] = # pending pushes that started after time i
<update-nb_pending_pushes-increment>
}

void __CSEQ_atomic_return_add_annotation(unsigned char id) {
    // if the pushed value has been already removed by a pop, then there is nothing to be done
    if (<insert-id_check-here>)
        return;

    unsigned char i;
    __CSEQ_assume ( 0 <= i & i < MAX_PUSHES );
    __CSEQ_assume ( existence[i] == 1 & ids[i] == id );
    finished[i] = 1;
    time_at_return[i] = clock;
    saw_return = 1;

    // this is no longer a pending remove
<update-nb_pending_pushes-decrement>
}

void __CSEQ_atomic_remove_empty_annotation(unsigned char id) {
    // either all pushes have been removed or they are pending (and can be linearized after this pop returning empty)
    __CSEQ_assert(<insert-assert-empty>);

    // Mark linearization point
    saw_lp[id] = 1;
}

void __CSEQ_atomic_remove_annotation(unsigned char id, val_type value) {
    // there must exist a push adding this value to the stack
    __CSEQ_assert(<insert-assert-existence>);
    unsigned char i;
    __CSEQ_assume ( 0 <= i & i < MAX_PUSHES );
    __CSEQ_assume ( existence[i] == 1 & values[i] == value );
    /* either (1) the push is pending (thus the push can be linearized before)
              (2) there is no other finished push (which hasn't been removed) between the return of the removed push and the call of this pop
                        |——| |——| pop
                        0  0 1  1 1
              (3) there is no other *finished* push starting after this push. Since pending pushes may never be closed (by __CSEQ_atomic_return_push_annotation, because they are removed by a pop), we have to count those that are removed before being closed.
    */
    __CSEQ_assert( finished[i] == 0 | pop_time_at_call[id] <= time_at_return[i] |  nb_pushes_started_after_time[ time_at_return[i] + 1 ] == (nb_pending_pushes_started_after_time[ time_at_return[i] + 1 ] - nb_pending_pushes_started_after_time_removed[ time_at_return[i] + 1 ]) );  // nb_pushes_started_after_time[ time_at_return[i] + 1 ] == 0

    // from 0 to MAX_CLOCK; nb_pending_pushes_started_after_time[i] = # pending pushes that started after time i
<update-nb_pushes-decrement>

    if (finished[i] == 0) {
        // from 0 to MAX_OPERATIONS-1; nb_pending_pushes_started_after_time_removed[i] = # pending pushes that started at time i and have been removed
<update-nb_pending_pushes_remove-increment>
    }

    // reset the used PUSH index
    existence[i] = 0;
    finished[i] = 0;
    ids[i] = 0;
    values[i] = 0;
    time_at_call[i] = 0;
    time_at_return[i] = 0;

    // Mark linearization point
    saw_lp[id] = 1;
}

