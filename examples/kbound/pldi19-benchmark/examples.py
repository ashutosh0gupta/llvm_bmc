exs1 = [
        ["05-pcm-spmc-unsafe", "05-pcs-spsc-2",2,2,1,"unsafe"],
        # ["01-tl-btlock-unsafe", "01-tl-btlock-6",6,10,1],
      ]

exs2 = [
        ["01-tl-btlock-opt-1"  , "01-tl-btlock-3",3,4,1,"unsafe"],
        ["01-tl-btlock-opt-2"  , "01-tl-btlock-3",3,5,2,"unsafe"],
        ["01-tl-btlock-opt-3"  , "01-tl-btlock-3",3,5,3,"unsafe"],
        
        ["02-slc-spinlock-110"  , "02-slc-spinlock-3",3,3,1,"unsafe"],
        ["02-slc-spinlock-111"  , "02-slc-spinlock-3",3,4,1,"unsafe"],
        ["02-slc-spinlock-220"  , "02-slc-spinlock-3",3,3,1,"unsafe"],
        ["02-slc-spinlock-222"  , "02-slc-spinlock-3",3,4,1,"unsafe"],
        ["02-slc-spinlock-330"  , "02-slc-spinlock-3",3,3,1,"unsafe"],
        ["02-slc-spinlock-333"  , "02-slc-spinlock-3",3,4,1,"unsafe"],
        
        ["03-dq-opt-deque-10010","03-dq-deque-3",3,3,1,"unsafe"],
        ["03-dq-opt-deque-11010","03-dq-deque-3",3,3,1,"unsafe"],
        ["03-dq-opt-deque-11011","03-dq-deque-3",3,3,1,"unsafe"],
        ["03-dq-opt-deque-11111","03-dq-deque-3",3,3,1,"unsafe"],
        ["03-dq-opt-deque-21111","03-dq-deque-3",3,3,1,"unsafe"],
        ["03-dq-opt-deque-21121","03-dq-deque-3",3,3,1,"unsafe"],

        ["05-pcm-spmc-111", "05-pcm-spmc-3",3,3,1,"unsafe"],
        ["05-pcm-spmc-222", "05-pcm-spmc-3",3,3,1,"unsafe"],
        ["05-pcm-spmc-333", "05-pcm-spmc-3",3,3,1,"unsafe"],

        ["05-pcs-spsc-111", "05-pcs-spsc-2",2,2,1,"unsafe"],
        ["05-pcs-spsc-222", "05-pcs-spsc-2",2,2,1,"unsafe"],
        ["05-pcs-spsc-333", "05-pcs-spsc-2",2,2,1,"unsafe"]
        
        # ["01-tl-btlock-unsafe", "01-tl-btlock-2",2],
        # ["01-tl-btlock-unsafe", "01-tl-btlock-3",3],
        # ["01-tl-btlock-unsafe", "01-tl-btlock-4",4],
        # ["01-tl-btlock-unsafe", "01-tl-btlock-5",5],
        # ["01-tl-btlock-unsafe", "01-tl-btlock-6",6],

        # ["01-tl-btlock-opt-unsafe", "01-tl-btlock-2",2],
        # ["01-tl-btlock-opt-unsafe", "01-tl-btlock-3",3],
        # ["01-tl-btlock-opt-unsafe", "01-tl-btlock-4",4],
        # ["01-tl-btlock-opt-unsafe", "01-tl-btlock-5",5],
        # ["01-tl-btlock-opt-unsafe", "01-tl-btlock-6",6],
    
        # ["01-tl-btlock-safe"  , "01-tl-btlock-2",2],
        # ["01-tl-btlock-safe"  , "01-tl-btlock-3",3],
        # ["01-tl-btlock-safe"  , "01-tl-btlock-4",4],
        # ["01-tl-btlock-safe"  , "01-tl-btlock-5",5],
        # ["01-tl-btlock-safe"  , "01-tl-btlock-6",6],

        # ["01-tl-btlock-opt-safe"  , "01-tl-btlock-2",2],
        # ["01-tl-btlock-opt-safe"  , "01-tl-btlock-3",3],
        # ["01-tl-btlock-opt-safe"  , "01-tl-btlock-4",4],
        # ["01-tl-btlock-opt-safe"  , "01-tl-btlock-5",5],
        # ["01-tl-btlock-opt-safe"  , "01-tl-btlock-6",6],

        # ["02-slc-spinlock-safe"  , "01-tl-btlock-2",2],
        # ["02-slc-spinlock-safe"  , "01-tl-btlock-3",3],
        # ["02-slc-spinlock-safe"  , "01-tl-btlock-4",4],
        # ["02-slc-spinlock-safe"  , "01-tl-btlock-5",5],
        # ["02-slc-spinlock-safe"  , "01-tl-btlock-6",6],

        # ["02-slc-spinlock-unsafe"  , "01-tl-btlock-2",2],
        # ["02-slc-spinlock-unsafe"  , "01-tl-btlock-3",3],
        # ["02-slc-spinlock-unsafe"  , "01-tl-btlock-4",4],
        # ["02-slc-spinlock-unsafe"  , "01-tl-btlock-5",5],
        # ["02-slc-spinlock-unsafe"  , "01-tl-btlock-6",6],

        # ["03-dq-deque-safe","03-dq-deque-3",3],
        # ["03-dq-opt-deque-safe","03-dq-deque-3",3],

        # ["05-pcm-spmc-unsafe", "05-pcs-spsc-2",2],
        # ["05-pcm-spmc-unsafe", "05-pcs-spsc-3",3],
        # ["05-pcm-spmc-unsafe", "05-pcs-spsc-4",4],
        # ["05-pcm-spmc-unsafe", "05-pcs-spsc-5",5],
        # ["05-pcm-spmc-unsafe", "05-pcs-spsc-6",6],

        # ["05-pcm-spmc-safe", "05-pcs-spsc-2",2],
        # ["05-pcm-spmc-safe", "05-pcs-spsc-3",3],
        # ["05-pcm-spmc-safe", "05-pcs-spsc-4",4],
        # ["05-pcm-spmc-safe", "05-pcs-spsc-5",5],
        # ["05-pcm-spmc-safe", "05-pcs-spsc-6",6],


        # ["05-pcs-spsc-safe", "05-pcs-spsc-2",2],
        # ["04-qu-queue-safe", "04-qu-queue-3",3],
    
       ]

exs = exs2

# exs = [ ["01-tl-btlock-unsafe"  , "01-tl-btlock-2",2],
#        ]
