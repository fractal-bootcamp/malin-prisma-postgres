/*
  Warnings:

  - You are about to drop the column `personwhowrotethebookId` on the `Book` table. All the data in the column will be lost.
  - You are about to drop the `Borrower` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `PersonWhoWroteTheBook` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `authorId` to the `Book` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Book" DROP CONSTRAINT "Book_memberId_fkey";

-- DropForeignKey
ALTER TABLE "Book" DROP CONSTRAINT "Book_personwhowrotethebookId_fkey";

-- AlterTable
ALTER TABLE "Book" DROP COLUMN "personwhowrotethebookId",
ADD COLUMN     "authorId" TEXT NOT NULL;

-- DropTable
DROP TABLE "Borrower";

-- DropTable
DROP TABLE "PersonWhoWroteTheBook";

-- CreateTable
CREATE TABLE "Author" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "biography" TEXT,

    CONSTRAINT "Author_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Member" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "address" TEXT,

    CONSTRAINT "Member_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Member_email_key" ON "Member"("email");

-- AddForeignKey
ALTER TABLE "Book" ADD CONSTRAINT "Book_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "Author"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Book" ADD CONSTRAINT "Book_memberId_fkey" FOREIGN KEY ("memberId") REFERENCES "Member"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
