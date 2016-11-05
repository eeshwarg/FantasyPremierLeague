import MySQLdb
db = MySQLdb.connect(host="localhost",user="root",passwd="11235813",db="FantasyPremierLeague_development")

c = db.cursor()

f = open("stats.txt","r")
lines = f.readlines()

# dict = {'MCI': 10, 'MUN': 11, 'ARS': 1, 'BRM': 2, 'AVL': 12 , 'CHE': 4, 'CRY': 5, 'EVE': 6, 'LEI': 8, 'LIV': 9, 'NEW': 3, 'NCI':7, 'SOU': 13, 'STO': 14, 'SUN': 15, 'SWC': 16, 'WTD': 18, 'WBA': 19, 'WHU': 20}

for x in lines:
    row = x.split(',')
    fname = row[0]
    lname = row[1]
    team = row[2]
    rating = row[3]
    position = row[4]
    try:
        c.execute("""INSERT INTO players(fname,lname,team_id,rating,position) values(%s,%s,%s,%s,%s)""",(fname,lname,dict[team],rating,position))
        db.commit()
    except:
        print "except"
        db.rollback
db.close()
f.close
