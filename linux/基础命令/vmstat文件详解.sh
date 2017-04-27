# vmstat命令
[root@node1 ~]# vmstat 2 3   #第一个参数是采样的时间间隔数，第二个参数是采样的次数
procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
 2  0      0 3981920    948  91192    0    0   211    21   46  138  0  1 99  0  0
 0  0      0 3981904    948  91192    0    0     0     0   14   16  0  0 100  0  0
 0  0      0 3981904    948  91192    0    0     0     0   12   11  0  0 100  0  0
	*2表示每隔2秒采集一下服务器状态，后面的3表示采集3次数据
实际上，在应用过程中，我们会在一段时间内一直监控，不想监控直接结束vmstat就行了，例如：
[root@node1 ~]# vmstat 1  #表示每1秒采集一次，直到我结束程序（ctrl+c）
procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
 2  0      0 3981840    948  91192    0    0   155    16   36  104  0  0 99  0  0
 0  0      0 3981824    948  91192    0    0     0     0   16   20  0  0 100  0  0
 0  0      0 3981824    948  91192    0    0     0     0   14   10  0  0 100  0  0
 0  0      0 3981824    948  91192    0    0     0     0   10   13  0  0 100  0  0
 0  0      0 3981824    948  91192    0    0     0     0    9   10  0  0 100  0  0
 	r：表示运行队列（就是说多少个进程真的分配到CPU），目前我这个机器没跑什么，所有很空闲，当这个值超过了CPU数目，就会出现CPU瓶颈。这个也和top的负载有关系，一般负载超过了3就比较高，超过了5就高，超过了10就不正常了，服务器的状态很危险。top的负载类似每秒的运行队列。如果运行队列过大，表示你的CPU很繁忙，一般会造成CPU使用率很高。
 	b：表示阻塞的进程或等待IO的进程数量。
 	swpd：虚拟内存已使用的大小，如果大于0，表示你的机器物理内存不足了，如果不是程序内存泄露的原因，那么就应该升级内存了或者把耗内存的任务迁移到其他机器。
 	free：空闲的物理内存的大小。
 	buff：已用的buff大小，对块设备的读写进行缓冲。
 	cache：已用的cache大小，文件系统的cache。
 	si：每秒从磁盘读入虚拟内存的大小，如果这个值大于0，表示物理内存不够用或者内存泄露了，要查找耗内存进程解决掉。
 	so：每秒虚拟内存写入磁盘的大小，如果这个值大于0，表示物理内存不够用或者内存泄露了，要查找耗内存进程解决掉。
 	bi：块设备每秒接收的块数量，这里的块设备是指系统上所有的磁盘和其他块设备，默认块大小是1024byte。
 	bo：块设备每秒发送的块数量，例如我们读取文件，bo就要大于0，bi和bo一般都要接近0，不然就是IO过于频繁，需要调整。
 	in：每秒CPU的中断次数，包括时间中断
 	cs：每秒上下文切换次数，例如我们调用系统函数，就要进行上下文切换，线程的切换，也要进行上下文切换，这个值越小越好。
 	us：用户进程执行消耗CPU时间（user Time）。
 	sy：系统进程消耗CPU时间，如果太高，表示系统调用时间长，例如是IO操作频繁。（sys值过高时，说明系统内核消耗的CPU资源多，这个不是良性的表现，我们应该检查原因）
 	id：空闲CPU时间，一般来说，id+us+sy=100，一般我认为id是空闲CPU使用率，us是用户使用率，sy是系统CPU使用率。
 	wt：等待IO CPU时间。（wa过高时，说明io等待比较严重，这可能是由于磁盘大量随机访问造成的，也有可能是磁盘的带宽出现瓶颈。）











# cat /proc/vmstat
nr_free_pages 953192
nr_alloc_batch 2506
nr_inactive_anon 2100
nr_active_anon 15437
nr_inactive_file 33850
nr_active_file 9366
nr_unevictable 0  #不稳定页数
nr_mlock 0
nr_anon_pages 10787
nr_mapped 10589  #映射到文件的页数
nr_file_pages 45361
nr_dirty 365    #脏页数
nr_writeback 0  #回写页数
nr_slab_reclaimable 6245
nr_slab_unreclaimable 2981
nr_page_table_pages 869  #分配到页表的页数
nr_kernel_stack 130
nr_unstable 0
nr_bounce 0
nr_vmscan_write 0
nr_vmscan_immediate_reclaim 0
nr_writeback_temp 0
nr_isolated_anon 0
nr_isolated_file 0
nr_shmem 2148
nr_dirtied 11799
nr_written 11347
numa_hit 277825
numa_miss 0
numa_foreign 0
numa_interleave 16465
numa_local 277825
numa_other 0
workingset_refault 0
workingset_activate 0
workingset_nodereclaim 0
nr_anon_transparent_hugepages 9
nr_free_cma 0
nr_dirty_threshold 284924
nr_dirty_background_threshold 94974
pgpgin 148778   #从启动到现在读入的内存页数
pgpgout 55493   #从启动到现在换出的内存页数
pswpin 0    #从启动到现在读入的交换分区页数
pswpout 0   #从启动到现在换出的交换分区页数
pgalloc_dma 1
pgalloc_dma32 287993
pgalloc_normal 69294
pgalloc_movable 0
pgfree 1310586      #从启动到现在释放的页数
pgactivate 10796    #从启动到现在激活的页数
pgdeactivate 0      #从启动到现在去激活的页数
pgfault 537830  #从启动到现在二级页面错误数
pgmajfault 922  #从启动到现在一级页面错误数
pgrefill_dma 0
pgrefill_dma32 0
pgrefill_normal 0
pgrefill_movable 0
pgsteal_kswapd_dma 0
pgsteal_kswapd_dma32 0
pgsteal_kswapd_normal 0
pgsteal_kswapd_movable 0
pgsteal_direct_dma 0
pgsteal_direct_dma32 0
pgsteal_direct_normal 0
pgsteal_direct_movable 0
pgscan_kswapd_dma 0
pgscan_kswapd_dma32 0
pgscan_kswapd_normal 0
pgscan_kswapd_movable 0
pgscan_direct_dma 0
pgscan_direct_dma32 0
pgscan_direct_normal 0
pgscan_direct_movable 0
pgscan_direct_throttle 0
zone_reclaim_failed 0
pginodesteal 0
slabs_scanned 0
kswapd_inodesteal 0
kswapd_low_wmark_hit_quickly 0
kswapd_high_wmark_hit_quickly 0
pageoutrun 1
allocstall 0
pgrotated 1
drop_pagecache 0
drop_slab 0
numa_pte_updates 0
numa_huge_pte_updates 0
numa_hint_faults 0
numa_hint_faults_local 0
numa_pages_migrated 0
pgmigrate_success 0
pgmigrate_fail 0
compact_migrate_scanned 0
compact_free_scanned 0
compact_isolated 0
compact_stall 0
compact_fail 0
compact_success 0
htlb_buddy_alloc_success 0
htlb_buddy_alloc_fail 0
unevictable_pgs_culled 5829
unevictable_pgs_scanned 0
unevictable_pgs_rescued 4735
unevictable_pgs_mlocked 7457
unevictable_pgs_munlocked 7457
unevictable_pgs_cleared 0
unevictable_pgs_stranded 0
thp_fault_alloc 88
thp_fault_fallback 0
thp_collapse_alloc 7
thp_collapse_alloc_failed 0
thp_split 2
thp_zero_page_alloc 1
thp_zero_page_alloc_failed 0