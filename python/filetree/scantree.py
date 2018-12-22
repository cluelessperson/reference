import os


def scantree(path, stay_in_filesystem=True):
    """
    recursively iterate throgh directories, by default staying in the same filesystem

    :param path:
    :param stay_in_filesystem:
    :return:
    """
    if stay_in_filesystem is True:
        stay_in_filesystem = os.stat(path).st_dev
    for entry in os.scandir(path):
        if entry.is_dir(follow_symlinks=False):
            if entry.stat().st_dev == stay_in_filesystem:
                yield from scantree(entry.path, stay_in_filesystem=stay_in_filesystem)
            else:
                yield entry
        elif entry.is_file(follow_symlinks=False):
            yield entry


if __name__ == "__main__":
    from sys import argv
    if not len(argv) > 1:
        print("expects a path argument")
        quit()

    for i, entry in enumerate(scantree(argv[-1])):
        print(i, entry.inode(), entry.path)
        if i > 9:
            break
