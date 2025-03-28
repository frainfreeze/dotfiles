> [!WARNING]  
> This is old, abandoned approach. I need to update this with current setup.

### Disks and backup
#### Setup
2 external hard drives, systemd and rsync.

There is a master drive and a slave drive (one that is a mirrored backup of the master). 

I’ve labeled the two disks so I can identify them by looking at `/dev/disk/by-label/`. The labeling can be done when you format them and create a filesystem or using the `e2label`.

Ensure the two disks are automatically mounted in a known location

```bash
    $ cd /media
    $ sudo mkdir DiskLabel
    $ sudo blkid
    $ sudo umount /your/disk
    $ sudo nano /etc/fstab #add disks using info from blkid
    $ sudo mount -a
    $ sudo chown -R $USER:$USER /media/disk # for admin rights on disk
```

Systemd timers are composed of two files, a service for performing some task, and a timer for specifying when the service should execute. The service file will point to a bash script that will call rsync to perform the actual task of mirroring the two drives.

#### Mirroring script
Mirroring script can be found in the bin folder.

```bash
# excerpt
rsync -ahvAE --delete --stats $SOURCE $DEST 2>&1 | tee $LOGS/drive-mirroring.log
```

We’ve used the `tee` command to pipe the output (stdout and stderr as per the 2>&1) of rsync to two places – stdout and the file $LOGS/drive-mirroring.log. The stdout in the context of this setup will be systemd’s journal (systemd’s logs) since we’ll be calling this bash script from within a systemd service.

In the script, I’ve specified some arguments to customize the behavior of rsync. Here is a brief description and reason for each option:
```
    a – Archive move; ensure common metadata is copied over
    h – Human readable numbers are output instead of bytes
    v – Increase verbosity of the output
    A – Preserve ACLs; also implies p (preserve permissions)
    E – Preserve executability
    delete – Delete file on the destination that don’t exist on source; clean up deleted files in backup
    stats – Give some file-transfer stats
```

#### Systemd Scripts

Save this file as `/etc/systemd/system/drive-mirroring.service`:

```bash
sudo cp drive-mirroring.service /etc/systemd/system/drive-mirroring.service
sudo cp drive-mirroring.timer /etc/systemd/system/drive-mirroring.timer
```

You can have a look at systemd timers to customize the frequency of the sync. I’ve set it to sync weekly (which defaults to Mondays at 12AM).

For systemd to actually run the `drive-mirroring.timer`, it must first be enabled or started (enabling will ensure it gets started after a reboot whereas a starting will not cause it to be automatically started across reboots).

```
$ systemctl enable drive-mirroring.timer  # or replace `enable` with `start`
```

You can get information about the systemd timer or service using `systemctl drive-mirroring.service` (hint – the .service can be omitted, but anything else like a .timer must be explicit).

And you can view the systemd logs for a particular service using` journalctl -u drive-mirroring.service`. We’ve also piped the output of rsync to $LOGS/drive-mirroring.log so the output of rsync can also be accessed there.
